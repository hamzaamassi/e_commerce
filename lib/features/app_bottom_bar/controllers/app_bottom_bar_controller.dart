import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppBottomBarController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
  RxInt selectedIndex = 0.obs;

  onTapNavFunction(int value) {
    selectedIndex.value = value;
  }
}
