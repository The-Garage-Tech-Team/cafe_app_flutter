
import 'package:cafe_app_project/logic/Controller/cart_controller.dart';
import 'package:cafe_app_project/model/product.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../View/widgets/textUtils.dart';
import '../../logic/Controller/auth_controller.dart';
import '../../logic/Controller/prodect_controller.dart';
import '../../utils/theme.dart';
import '../widgets/cart/card_total.dart';
import '../widgets/cart/cart_product_card.dart';
import '../widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();


  // final controller = Get.put(ProdectController());
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Cart Items"),
          elevation: 0,
          backgroundColor:
       buttonColor.withOpacity(0.8),
          centerTitle: true,
          actions: [
            // IconButton(
            //   onPressed: () {
            //     // controller.clearAllProducts();
            //   },
            //   icon: const Icon(Icons.backspace,color: Colors.white,),
            // ),

          ],

        ),
        body:


        Obx(
              () {
                if (controller.productsMap.isEmpty) {
                  return const EmptyCart();
                } else {
                  return


                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 600,
                            child:

                            // StreamBuilder(
                            //   stream: FirebaseFirestore.instance.collection('users').doc(authController.displayUserEmail.value).collection("cart").snapshots(),
                            //
                            //
                            //   builder: (context, snapshot) {
                            //     if (snapshot.hasData) {
                            //       print("not empty screen");
                            //       controller.prodects =
                            //
                            //           snapshot.data!.docs
                            //           .map((e) => Prodect(
                            //           productNumber: e['productNumber'],
                            //           productName: e['productName'],
                            //           description: e['description'],
                            //           category: e['category'],
                            //           price: e['price'],
                            //           quantity: e['quantity'],
                            //           imageUrl: e['imageUrl']))
                            //           .toList();
                            //       print("prodects.length   ${controller.prodects.length}");
                            //
                            //       if (controller.prodects.isNotEmpty) {
                            //         return CartProductCard(
                            //           prodect: controller.prodects,
                            //         );
                            //       } else {
                            //         print("empty screen");
                            //         return EmptyCart();
                            //       }
                            //     } else {
                            //       return CartProductCard(
                            //         prodect: controller.prodects,
                            //       );
                            //     }


                            // },
                            // ),
                            //
                            //
                            //
                            //
                            ListView.separated(
                              itemBuilder: (context, index) {
                                return CartProductCard(

                                  index: index,
                                  productModels:
                                  controller.productsMap.keys.toList()[index],
                                  quantity:
                                  controller.productsMap.values.toList()[index],
                                );
                              },
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                height: 20,
                              ),
                              itemCount: controller.productsMap.length,
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child:

                            CartTotal(),
                          ),
                        ],
                      ),
                    );
                }
              }
        ),
      ),
    );
  }
}