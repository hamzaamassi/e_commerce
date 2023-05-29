import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/features/sales/sale_controller.dart';
import 'package:e_commerce/features/sales/sales_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesPage extends GetView<SalesController> {
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
          return Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: controller.searchSales,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Search',
                      labelStyle:
                          TextStyle(color: Colors.white), // Change label color
                      prefixIcon: Icon(Icons.search,
                          color: Colors.white), // Change prefix icon color
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            color: Colors.white), // Change outline border color
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                            color: Colors.white), // Change focused border color
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.displayedSales.length,
                    itemBuilder: (context, index) =>
                        SalesCard(controller.displayedSales[index]),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
