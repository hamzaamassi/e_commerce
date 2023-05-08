import 'package:e_commerce/features/app_bottom_bar/views/app_bottom_bar.dart';
import 'package:e_commerce/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  void login() async {
    List<String> errors = <String>[];
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    if (email
        .trim()
        .isEmpty) {
      errors.add('CantEmptyEmail'.tr);
    }
    if (password
        .trim()
        .isEmpty) {
      errors.add('CantEmptyPassword'.tr);
    }
    if (password.isNotEmpty && password.length < 6) {
      errors.add('PasswordTooShort'.tr);
    }

    if (errors.isNotEmpty) {
      return;
    }
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text)
        .then((value) =>
    {
      print("Login Successfully "),
      Get.offAndToNamed(Routes.appBottomBar)
    })
        .onError((error, stackTrace) =>
    {print("Error ${error.toString()}")});
  }
}
