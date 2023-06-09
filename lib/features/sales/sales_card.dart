import 'package:e_commerce/features/sales/sale_controller.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalesCard extends GetView<SalesController> {
  late final SalesModel sales;

  SalesCard(SalesModel sale) {
    this.sales = sale;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16, top: 16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Colors.white.withOpacity(
            0.8), // Update the background color with reduced opacity
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sales.productName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Quantity: ${sales.quantity}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Price: ${sales.totalPrice} \$',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () => controller.removeProduct(sales.saleId,
                    sales.productId, sales.quantityAfterSale, sales.quantity),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            16.0), // Set the border radius here
                      ),
                    ),
                    backgroundColor:
                        MaterialStateColor.resolveWith((states) => Colors.red)),

                // controller.showSalesDialog(context, product),
                child: Text('Delete'),
              ),
            ),

            // product.image.isNotEmpty?
            //   Image.network(
            //     product.image,
            //     height: 100,
            //     width: 100,
            //     fit: BoxFit.cover,
            //   ):
            //   Image.asset(
            //     kLogo,
            //     width: 120,
            //     height: 120,
            //   )
          ],
        ),
      ),
    );
  }
}
