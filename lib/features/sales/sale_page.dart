import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/features/sales/sale_controller.dart';
import 'package:e_commerce/features/sales/sales_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesPage extends GetView<SalesController> {
  final SalesController salesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: Text(
          'Sales',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: mainColor,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else {
          return ListView(
            children: List.generate(controller.sales.length,
                (index) => SalesCard(controller.sales[index])),
          );
        }
      }),
    );
  }
}
