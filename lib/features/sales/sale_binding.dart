import 'package:e_commerce/features/sales/sale_controller.dart';
import 'package:get/get.dart';

class SalesBinding extends Bindings {
  @override
  void dependencies() {
    print("ttt SalesBinding");

    Get.lazyPut<SalesController>(() => SalesController());
  }
}
