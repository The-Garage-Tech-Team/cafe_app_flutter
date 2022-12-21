import 'package:badges/badges.dart';
import 'package:cafe_app_project/logic/Controller/cart_controller.dart';
import 'package:cafe_app_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/Controller/main_controller.dart';
import '../../routes/routs.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  // ),
                ),

                // ),
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.settingBar);
                  },
                  icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ],
              backgroundColor: buttonColor.withOpacity(0.8),
              title: Text(
                controller.title[MainController.currentIndex.value],
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: MainController.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: buttonColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: buttonColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.person_pin,
                    color: buttonColor,
                  ),
                  icon: Icon(
                    Icons.person_pin,
                    color: Colors.grey,
                  ),
                  label: '',
                ),
              ],
              onTap: (index) {
                MainController.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: MainController.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        },
      ),
    );
  }
}
