// ignore_for_file: avoid_print

import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/profile/profile_controller.dart';
import 'package:e_commerce/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Auth/controllers/login_manager.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({Key? key}) : super(key: key);
  final LoginManager loginManager = LoginManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('userId');

                  await FirebaseAuth.instance.signOut();
                  await loginManager.setLoggedIn(false);

                  Get.offAndToNamed(Routes.login);
                },
                icon: const Icon(Icons.logout))
          ],
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: mainColor,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  CustomTextField(
                    keyboardType: TextInputType.name,
                    text: "Username",
                    icon: Icons.person_outlined,
                    isPasswordType: false,
                    controller: controller.usernameController,
                    textInputAction: TextInputAction.none,
                    enable: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    text: "Email",
                    icon: Icons.email_outlined,
                    isPasswordType: false,
                    controller: controller.emailController,
                    textInputAction: TextInputAction.none,
                    enable: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    text: "Phone Number",
                    icon: Icons.phone_outlined,
                    isPasswordType: false,
                    controller: controller.phoneNumberController,
                    textInputAction: TextInputAction.none,
                    enable: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Company Name",
                    icon: Icons.group_work_outlined,
                    isPasswordType: false,
                    controller: controller.companyNameController,
                    textInputAction: TextInputAction.none,
                    enable: false,
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(height: 20),
                  CustomGeneralButton(
                    onTap: () => Get.toNamed(Routes.editProfile),
                    text: 'Edit',
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
