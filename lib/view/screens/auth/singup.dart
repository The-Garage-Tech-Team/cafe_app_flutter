





import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/auth_controller.dart';
import '../../../routes/routs.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/icon_widget.dart';
import '../../widgets/auth/signup_email.dart';
import '../../widgets/textUtils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.only(top: 90, bottom: 363, right: 40, left: 50),
          child: Column(
            children: [
              SizedBox(
                height: 63,
              ),
              TextUtils( text: "SING UP", fointSize: 15, fontWeight: FontWeight.bold, color: buttonColor,),


              SizedBox(
                height: 23,
              ),

              Container(
                height: 650,
                child:
                TabBarView(controller: controller.tabController, children: [
                  SignUp_Email_Form(),
                  // SignUp_Phone_Number_Form(),
                ]),
              )
            ],
          ), // end page
        ),
      ),
    );
  }
}
