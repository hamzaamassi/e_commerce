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
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a Username';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                    text: "Username",
                    icon: Icons.person_outlined,
                    isPasswordType: false,
                    controller: controller.usernameController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter an Email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    text: "Email",
                    icon: Icons.email_outlined,
                    isPasswordType: false,
                    controller: controller.emailController,
                    textInputAction: TextInputAction.next,
                    enable: false,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a Password';
                      }
                      if (value!.length < 6) {
                        return 'The password too short';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    text: "Password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: controller.passwordController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a Confirm password';
                      }
                      if (value!.length < 6) {
                        return 'The password not same length';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    text: "Confirm Password",
                    icon: Icons.lock_outline,
                    isPasswordType: true,
                    controller: controller.confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a Phone number';
                      }
                      if (value!.length < 10) {
                        return 'Please enter a Correct phone number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    text: "Phone Number",
                    icon: Icons.phone_outlined,
                    isPasswordType: false,
                    controller: controller.phoneNumberController,
                    textInputAction: TextInputAction.next,
                    enable: true,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter a Company name';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
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
