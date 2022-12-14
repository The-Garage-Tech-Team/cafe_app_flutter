


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextUtils extends StatelessWidget {
  final String text;
  final double fointSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration? underLine ;
  TextUtils(
      {Key? key,
        required this.text,
        required this.fointSize,
        required this.fontWeight,
        required this.color
        , this.underLine
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
        text,
        style:GoogleFonts.lato(
          decoration: underLine,
          textStyle:
          TextStyle(
            color: color,
            fontSize: fointSize,
            fontWeight: fontWeight,
          ),
        )
    );
  }
}
