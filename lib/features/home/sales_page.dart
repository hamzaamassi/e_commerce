import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/features/home/sales_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesPage extends GetView<HomeController> {
  SalesPage({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Sales Page"),centerTitle: true,backgroundColor: appBarColor),);
  }
}
