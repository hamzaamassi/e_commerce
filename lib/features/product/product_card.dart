import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/product/product_controller.dart';
import 'package:e_commerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsCard extends StatelessWidget {
  late final ProductsModel product;
  final ProductsController controller = Get.find();

  ProductsCard(ProductsModel prduct) {
    this.product = prduct;
  }

  void _sellProduct() {
    // Get.toNamed(Routes.sales, arguments: product.productId);
  }
  //
  // void _removeProduct() {
  //   controller.removeProduct(product.productId);
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // if (product.image.isNotEmpty)
          //   Image.network(
          //     product.image,
          //     height: 50,
          //     width: 50,
          //     fit: BoxFit.cover,
          //   ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Quantity: ${product.quantity}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  'Price: \$${product.price}',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomGeneralButton(
                      onTap: _sellProduct,
                      text: 'Sell',
                    ),
                    // IconButton(
                    //   onPressed: _removeProduct,
                    //   icon: Icon(Icons.delete),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
