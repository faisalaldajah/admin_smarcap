// ignore_for_file: constant_identifier_names

import 'package:admin_smarcap/Screen/splash/splash_binding.dart';
import 'package:admin_smarcap/Screen/splash/splash_view.dart';
import 'package:get/get.dart';

part 'routes.dart';

class AppPages {
  static const INITIAL = Routes.START_PAGE;

  static final routes = [
    GetPage(
        name: Routes.START_PAGE,
        page: () => const SplashView(),
        binding: SplashBinding()),
  ];
}
