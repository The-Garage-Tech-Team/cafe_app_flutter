



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
          Icon(Icons.shopping_cart,
          size: 150,
          color: Colors.black26,
          ),
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
                  text: "Empty",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ]
          ),
          ),
          SizedBox(height: 50,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15),

           ),
            elevation: 0
              ,
            primary: mainColor,
          ),
            onPressed: (){
              Get.toNamed(Routes.main_Screen);
            },
            child: Text("Go to home"))
        ],
      ),
    );
  }
}