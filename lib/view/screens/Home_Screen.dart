import 'package:cafe_app_project/view/widgets/user/search_form_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../View/widgets/textUtils.dart';
import '../../logic/Controller/prodect_controller.dart';
import '../../model/product.dart';
import '../../utils/theme.dart';
import '../widgets/user/cart_item_customer.dart';







class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProdectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
SizedBox(height: 30,),
        Container(
          height: 100,
          width: 400,
          // padding: EdgeInsets.only(top: 300, left: 15, right: 15, bottom: 15),
          child :Image.asset(
            "images/background.jpg",
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 10,),
        Container(

            child: SearchProducts()),
        SizedBox(
          height: 10,
        ),

        StreamBuilder(
          stream: controller.getData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              controller.prodects = snapshot.data!.docs
                  .map((e) => Prodect(
                      productNumber: e['productNumber'],
                      productName: e['productName'],
                      description: e['description'],
                      category: e['category'],
                      price: e['price'],
                      quantity: e['quantity'],
                      imageUrl: e['imageUrl']))
                  .toList();
              print('leeength ${controller.prodects.length}');
              if (controller.prodects.isNotEmpty) {
                return CardItem();
              } else {
                return Text("No thing");
              }
            } else {
              return CardItem();
            }
          },
        ),
      ]),
    );
  }
}
