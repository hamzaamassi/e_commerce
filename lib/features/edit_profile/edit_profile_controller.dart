import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();

  late String newUsername;
  late String newEmail;
  late String newPassword;
  late String newConfirmPassword;
  late String newPhoneNumber;
  late String nweCompanyName;

  late Rx<UserModel> userData;
  final String userId;

  EditProfileController(this.userId);

  @override
  void onInit() {
    super.onInit();
    FirebaseFirestore.instance
        .collection('user')
        .doc(userId)
        .snapshots()
        .listen((doc) {
      if (doc.exists) {
        userData = Rx<UserModel>(UserModel.fromMap(doc.data()!));
        var data = userData.value;
        usernameController.text = data.username;
        emailController.text = data.email;
        phoneNumberController.text = data.phoneNumber;
        companyNameController.text = data.companyName;
        passwordController.text = data.password;
        confirmPasswordController.text = data.password;

      }
    });
  }
  void onSave(){
    List<String> errors = <String>[];

    newUsername = usernameController.text.toString();
    newEmail = emailController.text.toString();
    newPassword = passwordController.text.toString();
    newConfirmPassword = confirmPasswordController.text.toString();
    newPhoneNumber = phoneNumberController.text.toString();
    nweCompanyName = companyNameController.text.toString();
    if (newUsername.trim().isEmpty) {
      errors.add("Can't empty username".tr);
    }
    if (nweCompanyName.trim().isEmpty) {
      errors.add("Can't empty company name".tr);
    }
    if (newPassword.trim().isEmpty) {
      errors.add("Can't empty password".tr);
    }
    if (newConfirmPassword.trim().isEmpty) {
      errors.add("Can't empty confirm password".tr);
    }
    if (newPhoneNumber.trim().isEmpty) {
      errors.add('Cant empty phone number'.tr);
    }

    if (newPassword.isNotEmpty && newPassword.length < 6) {
      errors.add('Password too short'.tr);
    }
    if (newPassword.isNotEmpty &&
        newConfirmPassword.isNotEmpty &&
        newPassword != newConfirmPassword) {
      errors.add('Password not same');
    }


    if (errors.isNotEmpty) {
      return;
    }
    _saveInformationData();

  }
  Future<void> _saveInformationData() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var data = HashMap<String, dynamic>();
      data["username"] = newUsername;
      data["password"] = newPassword;
      data["companyName"] = nweCompanyName;
      data["phoneNumber"] = newPhoneNumber;
      await FirebaseFirestore.instance.collection('user').doc(user.uid).update(data);
      Get.back();

    }
  }}
