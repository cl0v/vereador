import 'package:get/get.dart';

import 'package:presidente/app/modules/add_process/bindings/add_process_binding.dart';
import 'package:presidente/app/modules/add_process/views/add_process_view.dart';
import 'package:presidente/app/modules/home/bindings/home_binding.dart';
import 'package:presidente/app/modules/home/views/home_view.dart';
import 'package:presidente/app/modules/splash/bindings/splash_binding.dart';
import 'package:presidente/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.ADD_PROCESS,
      page: () => AddProcessView(),
      binding: AddProcessBinding(),
    ),
  ];
}
