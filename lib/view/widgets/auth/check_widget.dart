
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/Controller/auth_controller.dart';
import '../../../utils/theme.dart';

import '../textUtils.dart';

class CheckWidget2 extends StatelessWidget {
  CheckWidget2({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.CheckBox();
            },
            child: Container(
              height: 211,
              width: 4.58,
              decoration: BoxDecoration(
                  color: labalColor, borderRadius: BorderRadius.circular(4)),
              child: controller.isCheckBox
                  ? Icon(
                Icons.done,
                size: 15,
                color: Colors.white,
              )
                  : Icon(
                Icons.crop_square_rounded,
                size: 15,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 2.54,
          ),
          TextUtils(
            text: "Remember me ",
            color: labalColor,
            fontWeight: FontWeight.normal,
            fointSize: 9, underLine: TextDecoration.none,
          ),
          SizedBox(
            width: 3.05,
          ),
        ],
      );
    });
  }
}
