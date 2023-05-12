// ignore_for_file: avoid_print
import 'package:e_commerce/routes/app_pages.dart';
import 'package:get/get.dart';

import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/core/widgets/login_register_button.dart';
import 'package:e_commerce/features/Auth/controllers/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: mainColor,
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Image.asset(kLogo, fit: BoxFit.fitWidth, color: Colors.white),
              const SizedBox(height: 30),
              CustomTextField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter an email';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                text: "Email",
                icon: Icons.email_outlined,
                isPasswordType: false,
                controller: controller.emailController,
                textInputAction: TextInputAction.next,
                enable: true,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a Password';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                text: "password",
                icon: Icons.lock_outline,
                isPasswordType: true,
                controller: controller.passwordController,
                textInputAction: TextInputAction.done,
                enable: true,
              ),
              const SizedBox(height: 15),
              forgetPassword(),
              AuthButton(isLogin: true, onTap: () => controller.login()),
              const SizedBox(height: 10),
              registerOption()
            ],
          ),
        ),
      ),
    ));
  }

  Row registerOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.register);
          },
          child: const Text(
            " Register",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Row forgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          "Forget Password?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            // Get.to(const RegisterPage());
          },
          child: const Text(
            " Reset",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
