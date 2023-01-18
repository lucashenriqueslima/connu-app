import 'package:connu_app/app/data/services/auth/auth_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  @override
  void onReady() {
    super.onReady();

    Future.delayed(const Duration(seconds: 0), () {
      if (_authService.readUser().token != '') {
        // Get.offAllNamed('/home');
        Get.offAllNamed('/login');
      } else {
        Get.offAllNamed('/login');
      }
    });
  }
}
