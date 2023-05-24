import 'package:e_commerce/features/product/product_controller.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsCard extends GetView<ProductsController> {
  late final ProductsModel product;

  ProductsCard(ProductsModel product) {
    this.product = product;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16, left: 16, top: 16),
      child: Card(
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
                        product.name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Quantity: ${product.quantity}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Price: ${product.price} \$',
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
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF69A03A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () => controller.showSalesDialog(context, product),
                child: Text('Buy'),
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
