import 'package:flutter/material.dart';

class QuantityCounterDialog extends StatefulWidget {
  @override
  _QuantityCounterDialogState createState() => _QuantityCounterDialogState();
}

class _QuantityCounterDialogState extends State<QuantityCounterDialog> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Quantity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Select the quantity:'),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: decrementQuantity,
              ),
              Text('$quantity'),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: incrementQuantity,
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('OK'),
          onPressed: () {
            // Perform some action with the selected quantity
            Navigator.of(context).pop(quantity);
          },
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
