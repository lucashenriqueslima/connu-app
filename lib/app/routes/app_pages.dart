import 'package:get/get.dart';
import 'package:connu_app/app/modules/home/home_view.dart';
import 'package:connu_app/app/modules/login/login_view.dart';
import 'package:connu_app/app/modules/splash/splash_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/login/login_binding.dart';
import '../modules/register/register_binding.dart';
import '../modules/register/register_view.dart';
import '../modules/splash/splash_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}
