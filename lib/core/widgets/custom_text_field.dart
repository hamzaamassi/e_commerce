import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.text,
      required this.icon,
      required this.isPasswordType,
      required this.controller,
      required this.textInputAction,
      required this.enable})
      : super(key: key);
  final String text;
  final IconData icon;
  final TextInputAction textInputAction;
  final bool isPasswordType;
  final bool enable;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(

        controller: controller,
        enabled: enable,
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
            borderSide: const BorderSide(width: 0, style: BorderStyle.solid,color: Colors.white),
          ),
        ),
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        textInputAction: textInputAction);
  }
}
