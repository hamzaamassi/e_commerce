// ignore_for_file: avoid_print
import 'package:get/get.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/profile/profile_controller.dart';
import 'package:e_commerce/routes/app_pages.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends GetView<ProfileController> {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Edit Profile",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFCB2B93),
                Color(0xFF9546C4),
                Color(0xFF5E61F4),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 200),
                  CustomTextField(
                    text: "Username",
                    icon: Icons.person_outlined,
                    isPasswordType: false,
                    controller: controller.usernameController,
                    textInputAction: TextInputAction.none,
                    enable: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Email",
                    icon: Icons.email_outlined,
                    isPasswordType: false,
                    controller: controller.emailController,
                    textInputAction: TextInputAction.none,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: controller.passwordController,
                    textInputAction: TextInputAction.none,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Confirm password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: controller.confirmPasswordController,
                    textInputAction: TextInputAction.none,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Phone Number",
                    icon: Icons.phone_outlined,
                    isPasswordType: false,
                    controller: controller.phoneNumberController,
                    textInputAction: TextInputAction.none,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Company Name",
                    icon: Icons.group_work_outlined,
                    isPasswordType: false,
                    controller: controller.companyNameController,
                    textInputAction: TextInputAction.none,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomGeneralButton(
                    onTap: () => Get.toNamed(Routes.appBottomBar),
                    text: 'Save',
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
