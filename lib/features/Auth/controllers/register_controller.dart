import 'dart:collection';

import 'package:e_commerce/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();

  late String username;
  late String email;
  late String password;
  late String confirmPassword;
  late String phoneNumber;
  late String companyName;

  void register() async {
    List<String> errors = <String>[];
    username = usernameController.text.toString();
    email = emailController.text.toString();
    password = passwordController.text.toString();
    confirmPassword = confirmPasswordController.text.toString();
    phoneNumber = phoneNumberController.text.toString();
    companyName = companyNameController.text.toString();
    /*TODO use isValidData on User to valid data*/
    if (username.trim().isEmpty) {
      errors.add("Can't empty username".tr);
    }
    if (email.trim().isEmpty) {
      errors.add("Can't empty email".tr);
    }
    if (companyName.trim().isEmpty) {
      errors.add("Can't empty company name".tr);
    }
    if (password.trim().isEmpty) {
      errors.add("Can't empty password".tr);
    }
    if (confirmPassword.trim().isEmpty) {
      errors.add("Can't empty confirm password".tr);
    }
    if (phoneNumber.trim().isEmpty) {
      errors.add('Cant empty phone number'.tr);
    }

    if (password.isNotEmpty && password.length < 6) {
      errors.add('Password too short'.tr);
    }
    if (password.isNotEmpty &&
        confirmPassword.isNotEmpty &&
        password != confirmPassword) {
      errors.add('Password not same');
    }

    if (errors.isNotEmpty) {
      return;
    }
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => {
              Get.offAndToNamed(Routes.appBottomBar),
              _saveInformationData(),
            })
        .onError((error, stackTrace) => {});
  }

  Future<void> _saveInformationData() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var uid = user.uid;
      var data = HashMap<String, dynamic>();
      data["uid"] = uid;
      data["email"] = email;
      data["username"] = username;
      data["password"] = password;
      data["companyName"] = companyName;
      data["phoneNumber"] = phoneNumber;
      FirebaseFirestore.instance.collection('user').doc(user.uid).set(data);
    }
  }
}
