import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/features/Auth/login_page.dart';
import 'package:e_commerce/features/Auth/register_page.dart';
import 'package:e_commerce/features/app_bottom_bar/views/app_bottom_bar.dart';
import 'package:e_commerce/features/home/sales_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/splash/splash_page.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const PerfumeMarketing());
}

class PerfumeMarketing extends StatelessWidget {
  const PerfumeMarketing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      color: appBarColor,
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
    );
  }
}
