
import 'package:cafe_app_project/logic/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../widgets/settings/change_password.dart';
import '../../widgets/settings/logout.dart';
import '../../widgets/settings/notification.dart';
import '../../widgets/textUtils.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            SizedBox(
              height: 35,
            ),
            TextUtils(
              fointSize: 14,
              fontWeight: FontWeight.bold,
              text: "Account",
              color: Colors.grey.shade700,
            ),
            SizedBox(
              height: 35,
            ),
            ChangePassword(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            SizedBox(
              height: 3,
            ),
            NotificationWidget(),
            Divider(
              color: Colors.grey.shade300,
              thickness: 1,
            ),
            SizedBox(
              height: 3,
            ),
            LogOut(),
          ],
        ),
      ),
    );
  }
}
