import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  // TextEditingController usernameController = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController phoneNumberController = TextEditingController();
  // TextEditingController companyNameController = TextEditingController();

  late String uid = FirebaseAuth.instance.currentUser!.uid;
  late String username = '';
  late String email = '';
  late String password = '';
  late String phoneNumber = '';
  late String companyName = '';

  // Future<DocumentReference<Map<String, dynamic>>> getData() async {
  //   final user =  await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(uid);
  //
  //   return user;
  // }
  FutureOr<void> readData() async {
    FirebaseFirestore.instance
        .collection('user')
        .where('uid' == uid)
        .limit(1)
        .get()
        .whenComplete((value) {
          if (value.isSuccessful && !value.result.isEmpty) {
            var q;
            for (q in value.result) {
              username = (q.data["username"].toString());
              email = (q.data["email"].toString());
              password = (q.data["password"].toString());
              phoneNumber = (q.data["phoneNumber"].toString());
              companyName = (q.data["companyName"].toString());
              print('Username : $username');
              print('Email : $email');
              print('Password : $password');
              print('Phone Number : $phoneNumber');
              print('Company Name: $companyName');
            }
          }
        } as FutureOr<void> Function());
  }

}