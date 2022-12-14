

import 'package:flutter/material.dart';



import '../../../utils/theme.dart';
import '../textUtils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(100.7, 50),
      ),
      child: TextUtils(
        color: Colors.white,
        text: text,

        fontWeight: FontWeight.w500,
        underLine: TextDecoration.none, fointSize: 11,
      ),
    );
  }
}