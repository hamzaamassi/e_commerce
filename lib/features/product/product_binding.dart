import 'package:e_commerce/features/product/product_controller.dart';
import 'package:get/get.dart';

class ProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsController>(() => ProductsController());
  }
}
