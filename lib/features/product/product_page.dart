import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/features/product/product_card.dart';
import 'package:e_commerce/features/product/product_controller.dart';
import 'package:e_commerce/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsPage extends GetView<ProductsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text('Products',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: mainColor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.addProduct),
        child:
            Icon(Icons.add_shopping_cart_outlined, size: 36, color: mainColor),
        backgroundColor: Colors.white,
      ),
      body: 5 == 6
          ? SizedBox.shrink()
          : Obx(() {
              if (controller.isLoading.value) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Colors.white,
                ));
              } else {
                return ListView(
                  children: List.generate(
                    controller.products.length,
                    (index) => ProductsCard(controller.products[index]),
                  ),
                );
              }
            }),
    );
  }
}
