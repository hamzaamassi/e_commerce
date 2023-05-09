import 'package:e_commerce/core/constants.dart';
import 'package:get/get.dart';
import 'package:e_commerce/features/splash/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends GetView<SplashController> {
  SplashPage({Key? key}) : super(key: key);
  final SplashController splashController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kMainColor,
        body: Container(
            width: double.infinity,
            height: double.infinity,
color: mainColor,
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                color: Colors.white,
              ),
            )));
  }
}
