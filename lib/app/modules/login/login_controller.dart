import 'package:connu_app/app/data/services/auth/auth_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final authService = Get.find<AuthService>();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  final obscurePassowrd = true.obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
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
    if (value.isEmpty) {
      return "Forneça uma senha válida.";
    }
    return null;
  }

  Future<void> login() async {
    isLoading.value = true;

    final isValid = loginFormKey.currentState!.validate();

    if (!isValid) {
      isLoading.value = false;
      return;
    }

    final result = await authService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (result['status'] != 'success') {
      Get.defaultDialog(
        title: 'Falha ao fazer login',
        middleText: result['message'],
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      );

      isLoading.value = false;
      return;
    }

    authService.setUser(
      idUser: result['user']['id'],
      name: result['user']['name'],
      cpf: result['user']['cpf'],
      email: result['user']['email'],
      phone: result['user']['phone'],
      token: result['user']['token'],
    );

    authService.writeUser(authService.user.value);

    isLoading.value = false;

    Get.offAllNamed('/home');
  }
}
