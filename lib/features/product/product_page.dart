import 'package:e_commerce/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'product_controller.dart';

class ProductPage extends GetView<ProductController> {
  ProductPage({Key? key}) : super(key: key);
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Products Page"),
          centerTitle: true,
          backgroundColor: appBarColor),
      body: Column(
        children:  [

        ],
      ),
    );
  }
}
