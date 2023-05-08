
import 'package:e_commerce/features/Auth/controllers/login_controller.dart';
import 'package:e_commerce/features/Auth/controllers/register_controller.dart';
import 'package:e_commerce/features/splash/splash_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<RegisterController>(() => RegisterController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
