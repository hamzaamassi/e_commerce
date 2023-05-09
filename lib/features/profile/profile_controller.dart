import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();


  late Rx<UserModel> userData;
  final String userId;

  ProfileController(this.userId);

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

      }
    });
  }
}
