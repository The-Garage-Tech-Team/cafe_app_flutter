import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../View/widgets/textUtils.dart';
import '../../../logic/Controller/auth_controller.dart';
import '../../../logic/Controller/imagesProfile.dart';
import '../../../logic/Controller/setting_controller.dart';
import '../../widgets/settings/edit_profile.dart';
import '../../widgets/settings/settings.dart';

class SettingBar extends StatelessWidget {
  SettingBar({Key? key}) : super(key: key);
  final controllerImages = Get.put(ImagesController());
  final controller = Get.put(SettingController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("image path ${controller.imagePath1}");
    print("username ${authController.displayUserName.value}");
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: const Text(
              'Edit Profile',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
          body: GetBuilder<AuthController>(builder: (_) {
            return Obx(() => Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: authController.displayUserPhoto.value == ""
                                  ? const AssetImage("assets/images/avtar.png")
                                      as ImageProvider
                                  : NetworkImage(
                                      authController.displayUserPhoto.value,
                                    ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayUserName.value,
                          color: Colors.black,
                          fointSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextUtils(
                          text: authController.displayDescription.value,
                          color: Colors.black87,
                          fointSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextUtils(
                          fointSize: 14,
                          fontWeight: FontWeight.bold,
                          text: "Account",
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      EditProfile(),
                      Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SettingsWidget(),
                      SizedBox(height: 2),
                    ],
                  ),
                ));
          })),
    );
  }
}
