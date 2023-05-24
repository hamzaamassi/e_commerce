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
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        onChanged: controller.searchProducts,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Search',
                          labelStyle: TextStyle(
                              color: Colors.white), // Change label color
                          prefixIcon: Icon(Icons.search,
                              color: Colors.white), // Change prefix icon color
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Change outline border color
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                color: Colors
                                    .white), // Change focused border color
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: List.generate(
                          controller.displayedProducts.length,
                          (index) =>
                              ProductsCard(controller.displayedProducts[index]),
                        ),
                      ),
                    ),
                  ],
                );
              }
            }),
    );
  }
}
