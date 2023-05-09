// ignore_for_file: avoid_print
import 'package:e_commerce/core/constants.dart';
import 'package:get/get.dart';

import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/core/widgets/login_register_button.dart';
import 'package:e_commerce/features/Auth/controllers/register_controller.dart';
import 'package:flutter/material.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Register",
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
                  const SizedBox(height: 200),
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
                    enable: true,
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
                  AuthButton(isLogin: false, onTap: () => controller.register())
                ],
              ),
            ),
          ),
        ));
  }

  Row loginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Get.to(const RegisterPage());
          },
          child: const Text(
            " Login",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
