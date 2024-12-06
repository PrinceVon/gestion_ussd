import 'package:get/get.dart';
import 'package:ussed_manager/app/modules/home/bindings/home_binding.dart';
import 'package:ussed_manager/app/modules/operateur/views/operateur_view.dart';

import '../modules/home/views/home_view.dart';
import '../modules/operateur/bindings/operateur_binding.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static const HOME = _Paths.HOME;
  static const OPERATEUR = _Paths.OPERATEUR;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.OPERATEUR,
      page: () => const OperateurView(),
      binding: OperateurBinding(),
    ),
  ];
}
