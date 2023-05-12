import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.isPasswordType,
    required this.controller,
    required this.textInputAction,
    required this.enable,
    this.validator,
    required this.keyboardType,
    this.decoration,
    required this.icon,
  }) : super(key: key);
  final String text;
  final bool isPasswordType;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final bool enable;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final InputDecoration? decoration;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enable,
      validator: validator,
      obscureText: isPasswordType,
      enableSuggestions: !isPasswordType,
      autocorrect: isPasswordType,
      cursorColor: Colors.white,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
        ),
        labelText: text,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
              width: 0, style: BorderStyle.solid, color: Colors.white),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
