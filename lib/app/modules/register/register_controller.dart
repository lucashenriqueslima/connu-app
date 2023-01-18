import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../data/services/auth/auth_service.dart';

class RegisterController extends GetxController {
  final authService = Get.find<AuthService>();

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  late TextEditingController
      // nameController,
      // cpfController,
      emailController,
      // phoneController,
      passwordController,
      passwordConfirmController;

  final obscurePassowrd = true.obs;
  final obscurePassowrdConfirm = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // nameController = TextEditingController();
    // cpfController = TextEditingController();
    emailController = TextEditingController();
    // phoneController = TextEditingController();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Forneça um email válido.";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "A senha deve ter pelo menos 6 caracteres.";
    }
    return null;
  }

  String? validatePasswordConfirm(String value) {
    if (value != passwordConfirmController.text) {
      return "As senhas não coincidem.";
    }

    return null;
  }

  Future<void> register() async {
    isLoading.value = true;

    final isValid = registerFormKey.currentState!.validate();

    if (!isValid) {
      isLoading.value = false;
      return;
    }

    final result = await authService.register(
      name: '',
      cpf: '',
      email: emailController.text,
      phone: '',
      password: passwordController.text,
      passwordConfirm: passwordConfirmController.text,
    );

    print(result);
    if (result?['status'] != 'success') {
      Get.defaultDialog(
        title: 'Email já cadastrado!',
        middleText: result['message'],
        textConfirm: 'OK',
        onConfirm: () {
          Get.back();
        },
      );
      isLoading.value = false;
      return;
    }
    authService.setUser(
      idUser: result['user']['id'],
      email: result['user']['email'],
      token: result['user']['token'],
    );

    authService.writeUser(authService.user.value);

    isLoading.value = false;

    Get.offAllNamed('/home');
  }
}
