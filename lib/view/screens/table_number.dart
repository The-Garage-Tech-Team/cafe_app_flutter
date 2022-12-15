


 import 'package:cafe_app_project/logic/Controller/cart_controller.dart';

import 'package:cafe_app_project/model/order_model.dart';
import 'package:cafe_app_project/utils/theme.dart';
import 'package:cafe_app_project/view/widgets/auth/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../model/product.dart';
import '../../routes/routs.dart';

import '../widgets/textUtils.dart';

class Table_Number_screen extends StatelessWidget {
 Table_Number_screen({Key? key}) : super(key: key);
 final orderc = Get.put(CartController());

   final TextEditingController tableNumber = TextEditingController();

   @override
   Widget build(BuildContext context) {

     final GlobalKey<FormState> _forkey = GlobalKey();
     return Scaffold(


       body: Stack(
         children: [


           SizedBox(
             width: double.infinity,
             height: double.infinity,
             child: Image.asset(
               "images/background.jpg",
               fit: BoxFit.cover,
             // opacity: C,
             ),
           ),


           Center(


             child: Padding(
               padding: const EdgeInsets.only(top: 200 ),
               child: Container(

                 height: Get.height /2 ,
                 width: Get.width /2,

                   child: Column(
                     children: [
                       TextUtils(
                           text: "Table Number",
                           color: mainColor,
                           fontWeight: FontWeight.bold,
                           fointSize:20,
                           ),
                       SizedBox(height: 30,),

                       Form(
                         key: _forkey,
                         child: TextFormField(
                           textAlign: TextAlign.left,
                           validator: (value) {
                             if (value!.isEmpty) {
                               return "Enter please number table";
                               // print(double.parse(value));
                             } else if (double.parse(value) <= 0) {
                               return "you must enter more than 0";
                             }
                             // else if (double.parse(value!) <  0 ) {
                             //   return "Plese Enter Income....!";
                             // }
                           },
                           decoration: InputDecoration(
                             border: OutlineInputBorder(),
                             //
                             // labelText: "Your income",
                             labelStyle: TextStyle(
                               fontSize: 16,
                             ), //xrgba(0, 71, 147, 1)
                             hintText: "Enter the Table Number  ",
                             hintStyle: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                             ),
                           ),
                           keyboardType: TextInputType.number,
                           controller: tableNumber,
                         ),
                       ),



                 // TextFormField(
                 //   textAlign: TextAlign.right,
                 //   decoration: InputDecoration(
                 //     border: OutlineInputBorder(),
                 //     // labelText: "Do you want to start saving?",
                 //     labelStyle: TextStyle(
                 //         fontSize: 16, color: Colors.grey), //xrgba(0, 71, 147, 1)
                 //     hintText: "ادخل كمبة الادخار الذي تريده (اختياري)",
                 //
                 //     hintStyle: TextStyle(
                 //       fontSize: 12,
                 //     ),
                 //   ),
                 //   keyboardType: TextInputType.number,
                 //   inputFormatters: <TextInputFormatter>[
                 //     FilteringTextInputFormatter.allow(
                 //         RegExp(r'^[1-9][0-9]*'))
                 //   ],
                 //   controller: tableNumber,
                 // ),






                       // AuthTextFromField(
                       //   controller: tableNumber,
                       //   obscureText: false,
                       //   prefixIcon: const Icon(
                       //     Icons.table_bar_rounded,
                       //     color: mainColor,
                       //   ),
                       //   suffixIcon: const Text(''),
                       //   validator: (value) {
                       //     if (!RegExp(validationEmail).hasMatch(value)) {
                       //       return 'Invalid Email';
                       //     } else {
                       //       return null;
                       //     }
                       //   },
                       //   hintText: 'Enter your E-mail',
                       // ),

                       SizedBox(height: 30,),
                       AuthButton(onPressed: () async {
           if (_forkey.currentState!.validate()) {
     CartModel cartModel = CartModel(
     tableNumber: tableNumber.text,
     nameOrder: "",
     note: "",
     quantity: 0,
     price: 0,
     isfavorite: false,

     );
     //


      await orderc.addProdect(cartModel);
     } else {
     return;
     }




            // orderc.addProdect(cartModel);
               Get.toNamed(Routes.main_Screen);
           },

                       text: "Enter")
                     ],
                   ),


               ),
             ),

           ),
         ],
       ),


     );
   }
 }
