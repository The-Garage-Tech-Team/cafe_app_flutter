
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../../logic/Controller/auth_controller.dart';

import '../../../utils/theme.dart';

import '../../widgets/auth/login_email_form.dart';

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
          child: Column(
              children: [

            TextUtils( text: "LOG IN", fointSize: 15, fontWeight: FontWeight.bold, color: buttonColor,),

            SizedBox(
              height: 23,
            ),

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
