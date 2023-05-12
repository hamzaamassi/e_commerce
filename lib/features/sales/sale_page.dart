import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/sales/sale_controller.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesPage extends StatelessWidget {
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
      body: Container(
          padding: EdgeInsets.all(20),
          child: ListView.builder(
            itemCount: salesController.sales.length,
            itemBuilder: (context, index) {
              SalesModel sale = salesController.sales[index];
              return SalesCard(
                sale: sale,
                onRemovePressed: () {
                  salesController.removeSale(sale.saleId);
                },
              );
            },
          )),
    );
  }
}

class SalesCard extends StatelessWidget {
  final SalesModel sale;
  final VoidCallback onRemovePressed;

  SalesCard({
    required this.sale,
    required this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product Name: ${sale.productName}'),
            Text('Quantity: ${sale.quantity}'),
            Text('Price: ${sale.price}'),
            Text('Total Price: ${sale.totalPrice}'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomGeneralButton(
                  onTap: onRemovePressed,
                  text: 'Remove',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
