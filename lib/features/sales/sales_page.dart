import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/features/sales/sales_controller.dart';

class SalesPage extends GetView<SalesController> {
  SalesPage({Key? key}) : super(key: key);
  final SalesController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Sales Page"),
          centerTitle: true,
          backgroundColor: appBarColor),
    );
  }
}
