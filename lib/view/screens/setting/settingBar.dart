


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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      // ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //         primary: buttonColor,
                      //         shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(10),
                      //         ),
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 30, vertical: 7)),
                      //     onPressed: () {
                      //       Get.to(UplodImageProfile());
                      //       // Get.toNamed(Routes.loginScreen);
                      //
                      //
                      //     },
                      //     child: TextUtils(
                      //       text: 'Select Image',
                      //       fointSize: 22,
                      //       fontWeight: FontWeight.bold,
                      //       color: Colors.white, underLine: TextDecoration.none,
                      //     )),
                      // SizedBox(width: 100,),

                    ],
                  ),
                  //
                  // Container(
                  //   height: 200,
                  //   width: 371,
                  //
                  //   color: Colors.white,
                  //
                  //   child:
                  //   // Text("kk")
                  //
                  //   StreamBuilder(
                  //     stream: FirebaseFirestore.instance.collection('users').doc(authController.displayUserEmail.value).collection("ImagesUserProfile").snapshots(),
                  //
                  //
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         print("not empty screen");
                  //         controllerImages.userImages = snapshot.data!.docs
                  //             .map((e) => UserImages(
                  //
                  //             imageUrl: e['image']))
                  //             .toList();
                  //         print("prodects.length   ${controllerImages.userImages.length}");
                  //
                  //         if (controllerImages.userImages.isNotEmpty) {
                  //           return ImageUserProfile(
                  //             prodect : controllerImages.userImages,
                  //           );
                  //         } else {
                  //
                  //           return Text("If you love art in coffee plesea shara this art");
                  //         }
                  //       } else {
                  //         return ImageUserProfile(
                  //           prodect: controllerImages.userImages,
                  //         );
                  //       }
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //
                  //     },
                  //
                  //
                  //
                  //   ),
                    // ImagesProfileUser(),
                  // )
              ],
              ),
            ));
          })),
    );
  }
}
