import 'package:e_commerce/core/constants.dart';
import 'package:get/get.dart';
import 'package:e_commerce/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'product_controller.dart';

class ProductPage extends GetView<ProductController> {
  ProductPage({Key? key}) : super(key: key);
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Get.offAndToNamed(Routes.login);
              },
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text(
          "Products",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
