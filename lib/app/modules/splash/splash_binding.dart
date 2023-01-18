import 'package:get/get.dart';
import 'package:connu_app/app/modules/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
