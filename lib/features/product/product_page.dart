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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Text("Products Page"),
          centerTitle: true,
          backgroundColor: appBarColor),
      body: ElevatedButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
          Get.offAndToNamed(Routes.login);
        },
        child: const Text("Logout"),
      ),
    );
  }
}
