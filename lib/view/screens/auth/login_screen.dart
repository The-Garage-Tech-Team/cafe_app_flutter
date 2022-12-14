
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


import '../../../logic/Controller/auth_controller.dart';
import '../../../routes/routs.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_filed.dart';
import '../../widgets/auth/continer.dart';

import '../../widgets/auth/icon_widget.dart';
import '../../widgets/auth/login_email_form.dart';
import '../../widgets/auth/login_phone.dart';
import '../../widgets/textUtils.dart';


class Login_Screen extends StatelessWidget {
  Login_Screen({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding:
        const EdgeInsets.only(top: 154, bottom: 363, right: 45, left: 55),
        child: Container(
          height: 500,
          width: 500,
          child: Column(children: [
      //     TextUtils(
      //       text: "Login by",
      //       color: labalColor,
      //       fontWeight: FontWeight.normal,
      //       fointSize: 11,
      //       underLine: TextDecoration.none,
      //     ),
      //     SizedBox(
      //       height: 58,
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         GetBuilder<AuthController>(builder: (_) {
      //           return IconWidget(
      //             conternierColor: conternierColor,
      //           onPressed: () async {
      // await  controller.loginUsinggoogle();
      // showDialog(
      // context: context,
      // builder: (context) {
      // return Center(child: CircularProgressIndicator());
      //
      // },
      //
      // );
      //
      // // Get.toNamed(Routes.customerHome);
      // },
      // image: 'assets/images/image 14google.png',
      // textUtils: "with Google",
      // );
      // }),
      //
      //         SizedBox(
      //           width: 5.08,
      //         ),
      //         IconWidget(
      //           conternierColor: Colors.black,
      //           onPressed: () {},
      //           image: 'assets/images/image 16Apple.png',
      //           textUtils: "with Apple",
      //         ),
      //       ],
      //     ),
      //       SizedBox(
      //         height: 36,
      //       ),
            // TextUtils(
            //     text: "or",
            //     color: labalColor,
            //     fontWeight: FontWeight.normal,
            //     fointSize: 11,
            //     underLine: TextDecoration.none,),
            SizedBox(
              height: 23,
            ),
            // Container(
            //   height: 47,
              // child: TabBar(
              //     controller: controller.tabController,
              //     indicatorColor: Colors.black,
              //     labelColor: Colors.black,
              //     unselectedLabelColor: labalColor,
              //     tabs: [
              //       Tab(
              //         child: Text("Email", style: TextStyle(fontSize: 12)),
              //       ),
              //       Tab(
              //           child: Text("Phone number",
              //               style: TextStyle(fontSize: 12)))
              //     ]),
            // ),
            Container(
              // height: ,
              child: Expanded(
                child: TabBarView(
                    controller: controller.tabController,
                    children: [Login_Email_Form(),
                      // Login_PhoneNumber_Form()
                ]
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
