import 'package:cafe_app_project/logic/Controller/auth_controller.dart';

import 'package:cafe_app_project/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routs.dart';
import '../../utils/theme.dart';

class CartController extends GetxController {
  final prodectRef = FirebaseFirestore.instance;
  var productsMap = {}.obs;
  final authController = Get.put(AuthController());

  final prodectRefUser = FirebaseFirestore.instance.collection('users');
  void addProductToCart(Prodect productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += 1;
    } else {
      productsMap[productModels] = 1;
    }
  }

  void removeProductsFarmCart(Prodect productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }
  }

  void removeOneProduct(Prodect productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.grey,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? googleColor : googleColor,
    );
  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }

  void addFirebaseCart(Prodect prodect) {
    if (productsMap.containsKey(prodect)) {
      productsMap[prodect] += 1;
    } else {
      productsMap[prodect] = 1;
    }
  }

  var carts = <CartModels>[].obs;
  // var orders = {}.obs;

  Future<void> addProdectCart(Prodect prodect) async {
    var indexWanted = carts.indexWhere((element) {
      print("-----------------${element.productNumber}");
      return element.productNumber == prodect.productNumber;
    });
    print("------------- ${prodect.productNumber}");
    print(indexWanted);
    print("-------------");

    if (indexWanted >= 0) {
      await prodectRefUser
          .doc(authController.displayUserEmail.value)
          .collection("carts")
          .doc(prodect.productNumber.toString())
          .delete();
      Get.snackbar("", "deleted successfully..");
    } else {
      final comicRef = prodectRefUser
          .doc(authController.displayUserEmail.value)
          .collection("carts")
          .doc(prodect.productNumber.toString());
      final data = prodect.toJson(); // insert to fiserbase
      print("----- ${comicRef.id}");
      print("------------- ${prodect.productNumber}");

      comicRef.set(data).whenComplete(() {
        if (comicRef.id == prodect.productNumber.toString()) {
          Get.snackbar("", "Added successfully..");
        } else {
          Get.snackbar("Error", "something went wrong");
        }
      }).catchError((error) {
        Get.snackbar("Error", "something went wrong");
      });
    }
  }



  Future<void> deleteDataCart(String nameId) async {
    await prodectRefUser
        .doc(authController.displayUserEmail.value)
        .collection("cart")
        .doc(nameId)
        .delete();
  }

}
