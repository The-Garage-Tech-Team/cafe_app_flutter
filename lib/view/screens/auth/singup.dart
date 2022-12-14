





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
              // TextUtils(
              //   text: 'Sign Up by',
              //
              //   fontWeight: FontWeight.normal,
              //   color: mainColor,
              //   underLine: TextDecoration.none, fointSize: 16,),
              // SizedBox(
              //   height: 37,
              // ),
              // Row(
              //   children: [
              //     GetBuilder<AuthController>(builder: (_) {
              //       return IconWidget(
              //         conternierColor: googleColor,
              //         onPressed: () async {
              //           await controller.loginUsinggoogle();
              //
              //           showDialog(
              //             context: context,
              //             builder: (context) {
              //               return Center(child: CircularProgressIndicator());
              //             },
              //
              //           );
              //           // Get.toNamed(Routes.customerHome);
              //
              //         },
              //         textUtils: 'with Google',
              //         image: 'assets/images/image 14google.png',
              //       );
              //     }),
              //     SizedBox(
              //       width: 4,
              //     ),
              //     GetBuilder<AuthController>(
              //       builder: (_) {
              //         return IconWidget(
              //           conternierColor: Colors.black,
              //           onPressed: () {},
              //           textUtils: 'with Apple',
              //           image: 'assets/images/image 14google.png',
              //         );
              //       },
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 63,
              ),
              // TextUtils(
              //   text: 'or',
              //
              //   fontWeight: FontWeight.normal,
              //   color: mainColor,
              //   underLine: TextDecoration.none, fointSize: 11,),
              SizedBox(
                height: 23,
              ),
              Container(
                height: 40,
                child: TabBar(
                  controller: controller.tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: mainColor,
                  tabs: [
                    Tab(
                      child: Text(
                        'Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Phone number',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ],
                ),
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
