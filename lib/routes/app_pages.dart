// ignore_for_file: constant_identifier_names

import 'package:e_commerce/features/Auth/bindings/auth_binding.dart';
import 'package:e_commerce/features/Auth/login_page.dart';
import 'package:e_commerce/features/Auth/register_page.dart';
import 'package:e_commerce/features/app_bottom_bar/app_bottom_bar_binding.dart';
import 'package:e_commerce/features/app_bottom_bar/views/app_bottom_bar.dart';
import 'package:e_commerce/features/home/sales_page.dart';
import 'package:e_commerce/features/profile/profile_page.dart';
import 'package:e_commerce/features/splash/splash_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.splash;

  static final routes = [
    GetPage(
        name: _Paths.appBottomBar,
        page: () => AppBottomBar(),
        binding: AppBottomBarBinding()),
    GetPage(
      name: _Paths.home,
      page: () => SalesPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () =>  LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.register,
      page: () =>  RegisterPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: _Paths.splash,
      page: () =>  SplashPage(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: _Paths.profile,
      page: () =>  ProfilePage(),
    ),
  ];
}
