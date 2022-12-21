import 'package:cafe_app_project/view/widgets/user/search_form_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../logic/Controller/prodect_controller.dart';
import '../../model/product.dart';

import '../widgets/cart/cart_item_customer.dart';







class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(ProdectController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
SizedBox(height: 5,),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

              child: SearchProducts()
          ),
        ),
        SizedBox(height: 5,),
        Container(
          height: 100,
          width: 400,
          // padding: EdgeInsets.only(top: 300, left: 15, right: 15, bottom: 15),
          child :
            CarouselSlider(items:controller.imageListSlider.map((e) => ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(e,
                  height: 200,
                  width: 100,
                  fit: BoxFit.cover,)
                ],
              ),
            )).toList() , options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              height: 150,
            ),)

        ),
        SizedBox(height: 10,),

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

              print('leeength ${controller.imgUrl}');
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
