// ignore_for_file: avoid_print
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/edit_profile/edit_profile_controller.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends GetView<EditProfileController> {
   EditProfilePage({Key? key}) : super(key: key);
  // final EditProfileController editProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          elevation: 0,
          title: const Text(
            "Edit Profile",
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
                    text: "Username",
                    icon: Icons.person_outlined,
                    isPasswordType: false,
                    controller: controller.usernameController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Email",
                    icon: Icons.email_outlined,
                    isPasswordType: false,
                    controller: controller.emailController,
                    textInputAction: TextInputAction.next,
                    enable: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: controller.passwordController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Confirm password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: controller.confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Phone Number",
                    icon: Icons.phone_outlined,
                    isPasswordType: false,
                    controller: controller.phoneNumberController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    text: "Company Name",
                    icon: Icons.group_work_outlined,
                    isPasswordType: false,
                    controller: controller.companyNameController,
                    textInputAction: TextInputAction.done,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomGeneralButton(
                    onTap: () => controller.onSave(),
                    text: 'Save',
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
