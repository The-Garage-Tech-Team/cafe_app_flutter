
import 'package:cafe_app_project/View/widgets/textUtils.dart';
import 'package:cafe_app_project/logic/Controller/auth_controller.dart';
import 'package:cafe_app_project/logic/Controller/prodect_controller.dart';
import 'package:cafe_app_project/utils/theme.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/product.dart';
import '../widgets/favorite/favoriteWidget.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final controller = Get.put(ProdectController());
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(authController.displayUserEmail.value)
            .collection("Favorite")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("not empty screen");
            controller.prodectsFav = snapshot.data!.docs
                .map((e) => Prodect(
                    productNumber: e['productNumber'],
                    productName: e['productName'],
                    description: e['description'],
                    category: e['category'],
                    price: e['price'],
                    quantity: e['quantity'],
                    imageUrl: e['imageUrl']))
                .toList();
            print("prodects.length   ${controller.prodectsFav.length}");

            if (controller.prodectsFav.isNotEmpty) {
              return FavoriteInStock(
                prodect: controller.prodectsFav,
              );
            } else {
              print("empty screen");
              return Center(
                  child: TextUtils(
                text: 'empty Favorite ♡',
                fointSize: 30,
                fontWeight: FontWeight.bold,
                color: buttonColor,
              ));
            }
          } else {
            return FavoriteInStock(
              prodect: controller.prodectsFav,
            );
          }
        },
      ),
    );
  }
}
