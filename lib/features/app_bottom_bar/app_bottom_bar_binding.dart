
import 'package:e_commerce/features/app_bottom_bar/controllers/app_bottom_bar_controller.dart';
import 'package:e_commerce/features/home/sales_controller.dart';
import 'package:e_commerce/features/product/product_controller.dart';
import 'package:e_commerce/features/profile/profile_controller.dart';
import 'package:get/get.dart';

class AppBottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AppBottomBarController>(AppBottomBarController());

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductController>(() => ProductController());
    Get.put<ProfileController>(ProfileController());
  }
}
