import 'package:e_commerce/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/features/sales/sales_controller.dart';

class SalesPage extends GetView<SalesController> {
  SalesPage({Key? key}) : super(key: key);
  final SalesController salesController = Get.find();

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
          "Sales",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
