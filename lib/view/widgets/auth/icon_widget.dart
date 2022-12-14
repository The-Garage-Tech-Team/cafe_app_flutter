


import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../textUtils.dart';







class IconWidget extends StatelessWidget {
  final String image;
  final Function() onPressed;
  final String textUtils;
  final Color conternierColor;

  const IconWidget(
      {required this.image,
        required this.textUtils,
        required this.onPressed,
        required this.conternierColor,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 610,
        width: 33.84,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(backgroundColor: conternierColor),
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 5.85,
                  height: 281,
                ),
                SizedBox(
                  width: 1.52,
                ),
                TextUtils(
                  color: Colors.white,
                  fointSize: 9,
                  fontWeight: FontWeight.normal,
                  underLine: TextDecoration.none,
                  text: textUtils,
                ),
              ],
            )));
  }
}
