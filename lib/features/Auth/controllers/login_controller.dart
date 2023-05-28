import 'package:e_commerce/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_manager.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UserCredential? userCredential;
  final LoginManager loginManager = LoginManager();

  void login() async {
    List<String> errors = <String>[];
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    if (email.trim().isEmpty) {
      errors.add('CantEmptyEmail'.tr);
    }
    if (password.trim().isEmpty) {
      errors.add('CantEmptyPassword'.tr);
    }
    if (password.isNotEmpty && password.length < 6) {
      errors.add('PasswordTooShort'.tr);
    }

    if (errors.isNotEmpty) {
      return;
    }
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Get the user ID from the userCredential
      await loginManager.setLoggedIn(true);
      String userId = userCredential!.user!.uid;

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('userId', userId);

      print("Login Successfully");
      print("User ID: $userId");

      Get.offAndToNamed(Routes.appBottomBar);
    } catch (error) {
      // print("Error: $error");
      // Fluttertoast.showToast(
      //   msg: error.toString(),
      //   toastLength: Toast.LENGTH_SHORT,
      //   gravity: ToastGravity.BOTTOM,
      //   backgroundColor: Colors.grey,
      //   textColor: Colors.white,
      // );
    }
  }
}
