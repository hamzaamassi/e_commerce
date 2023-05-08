import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomBarController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;

  onTapNavFunction(int value) {
    selectedIndex.value = value;
  }
}
