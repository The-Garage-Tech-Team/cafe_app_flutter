
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routs.dart';
import '../../utils/theme.dart';
import '../widgets/textUtils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,

        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "images/background.jpg",
               fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  const SizedBox(
                    height: 500,
                  ),

                  // Image.asset(
                  //   "images/logo.png",
                  //   // fit: BoxFit.cover,
                  // ),



                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 7)),
                      onPressed: () {
                        Get.offNamed(Routes.loginScreen);
                        // Get.toNamed(Routes.loginScreen);


                      },
                      child: TextUtils(
                        text: 'Log In',
                        fointSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, underLine: TextDecoration.none,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Don't have an Acount ? ",
                        fointSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        underLine: TextDecoration.none,),
                      TextButton(
                          onPressed: () {


                            Get.offNamed(Routes.signupScreen);
                          },
                          child: TextUtils(
                            text: 'Sing Up',
                            fointSize: 18,
                            color: buttonColor,
                            fontWeight: FontWeight.normal,
                            underLine: TextDecoration.underline,
                          )),

                      TextUtils(
                        text: "Or ? ",
                        fointSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        underLine: TextDecoration.none,),

                      TextButton(
                          onPressed: () {


                            Get.offNamed(Routes.tabel_number);
                          },
                          child: TextUtils(
                            text: 'Skip',
                            fointSize: 18,
                            color: buttonColor,
                            fontWeight: FontWeight.normal,
                            underLine: TextDecoration.underline,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
