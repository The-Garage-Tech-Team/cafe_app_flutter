

//

import 'package:cafe_app_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routs.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 40,),
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: "Your cart is ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )
              ),
              TextSpan(
                  text: "Empty  🛒",
                  style: TextStyle(
                    color: buttonColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ]
          ),
          ),
          SizedBox(height: 50,),

        ],
      ),
    );
  }
}
