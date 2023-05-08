import 'package:e_commerce/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(controller.username);
    print(controller.email);
    print(controller.password);
    print(controller.phoneNumber);
    print(controller.companyName);
    return Scaffold(
      appBar: AppBar(
          title: const Text("Profile Page"),
          centerTitle: true,
          backgroundColor: appBarColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.username),
            Text(controller.email),
            Text(controller.password),
            Text(controller.phoneNumber),
            Text(controller.companyName),
          ],
        ),
      ),
    );
  }
}
