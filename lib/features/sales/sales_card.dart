import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
final SalesModel sale;
final VoidCallback onRemovePressed;

SalesCard({
  required this.sale,
  required this.onRemovePressed, required price, required quantitySold, required productName,
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
                text:'Remove',
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
}