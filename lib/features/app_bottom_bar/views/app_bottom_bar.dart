import 'package:e_commerce/features/app_bottom_bar/controllers/app_bottom_bar_controller.dart';
import 'package:e_commerce/features/app_bottom_bar/views/bottom_app_bar_item.dart';
import 'package:e_commerce/features/home/sales_page.dart';
import 'package:e_commerce/features/product/product_page.dart';
import 'package:e_commerce/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomBar extends StatelessWidget {
  AppBottomBar({Key? key}) : super(key: key);
  final AppBottomBarController controller = Get.find();

  final List<Widget> _pages = <Widget>[
    ProductPage(),
    SalesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: controller.scaffoldState,
        body: _pages[controller.selectedIndex.value],
        bottomNavigationBar: buildBottomNavigationBar(context),
      ),
    );
  }

  buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomAppBarItem(
            icon: Icons.production_quantity_limits_outlined,
            title: 'Products',
            isSelected: controller.selectedIndex.value == 0,
            onPressed: () => controller.onTapNavFunction(0),
          ),
          BottomAppBarItem(
            icon: Icons.monetization_on_outlined,
            title: 'Sales',
            isSelected: controller.selectedIndex.value == 1,
            onPressed: () => controller.onTapNavFunction(1),
          ),
          BottomAppBarItem(
            icon: Icons.person_outline,
            title: 'Profile',
            isSelected: controller.selectedIndex.value == 2,
            onPressed: () => controller.onTapNavFunction(2),
          ),
        ],
      ),
    );
  }
}
