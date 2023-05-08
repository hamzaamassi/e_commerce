import 'dart:async';

import 'package:e_commerce/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAndToNamed(Routes.appBottomBar);
      } else {
        Get.offAndToNamed(Routes.login);
    }

    });
  }
}
