
import 'package:cafe_app_project/view/widgets/textUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


import '../../../logic/Controller/auth_controller.dart';
import '../../../routes/routs.dart';
import '../../../utils/myString.dart';
import '../../../utils/theme.dart';
import 'auth_button.dart';
import 'auth_text_filed.dart';
import 'check.dart';
import 'continer.dart';

class Login_Email_Form extends StatelessWidget {
  Login_Email_Form({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
                text: 'E-mail',
                color: mainColor,
                fontWeight: FontWeight.w400,
                fointSize: 14,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 11,
          ),
          AuthTextFromField(
            controller: emailController,
            obscureText: false,
            validator: (value) {
              if (!RegExp(validationEmail).hasMatch(value)) {
                return "Worng E-mail";
              } else {
                return null;
              }
            },
            prefixIcon: Icon(
              Icons.email_outlined,
              color: labalColor,
            ),
            suffixIcon: const Text(''),
            hintText: "Enter your Email",
          ),
          SizedBox(
            height: 17,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: TextUtils(
                text: 'Password',
                color: mainColor,
                fontWeight: FontWeight.w400,
                fointSize: 14,
                underLine: TextDecoration.none),
          ),
          SizedBox(
            height: 11,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthTextFromField(
              maxLines: 1,
              controller: passwordController,
              obscureText: controller.isVisibilty ? false : true,
              validator: (value) {
                if (value.toString().length < 6) {
                  return " Worng password";
                } else {
                  return null;
                }
              },
              prefixIcon: Icon(
                Icons.lock_outline,
                color: labalColor,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.Visibilty();
                },
                icon: controller.isVisibilty
                    ? Icon(Icons.visibility_outlined,
                    color: labalColor, size: 20)
                    : Icon(Icons.visibility_off_outlined,
                    color: labalColor, size: 20),
                iconSize: 18,
              ),
              hintText: "Enter your password",
            );
          }),
          SizedBox(
            height: 11,
          ),
          CheckWidget(),
          SizedBox(
            height: 37,
          ),
          GetBuilder<AuthController>(builder: (_) {
            return AuthButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  String email = emailController.text.trim();
                  String password = passwordController.text;
                  print("dubg: ${email}");
                  controller.displayUserEmail.value = email;
                  controller.loginUsingFierbase(
                      email: email, password: password);
                  // show loding page after press login in button
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(child: CircularProgressIndicator());
                    },

                  );



                }
              },
              text: "Log In",
            );
          }),
          SizedBox(
            height: 100,
          ),



          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextUtils(
                    text: 'Don\'t  have account ?',
                    fointSize: 13,
                    fontWeight: FontWeight.normal,
                    color: mainColor,
                    underLine: TextDecoration.none),
                SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.signupScreen);
                  },
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerLeft),
                  child: TextUtils(
                      text: 'singup',
                      fointSize: 15,
                      fontWeight: FontWeight.w400,
                      color: buttonColor,
                      underLine: TextDecoration.underline),
                ),
              ],
            ),
          ),




        ],
      ),
    );
  }
}
