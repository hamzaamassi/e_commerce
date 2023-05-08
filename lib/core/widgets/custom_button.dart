import 'package:flutter/material.dart';
import 'package:e_commerce/core/constants.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({Key? key, this.text, this.onTap})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: appBarColor, borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
