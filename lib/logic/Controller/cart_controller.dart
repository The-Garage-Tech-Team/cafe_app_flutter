




import 'package:cafe_app_project/model/order_model.dart';
import 'package:cafe_app_project/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/routs.dart';
import '../../utils/theme.dart';

class CartController extends GetxController{
  final prodectRef = FirebaseFirestore.instance;
  var productsMap = {}.obs;

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


  //

  late TextEditingController tableNumber ;

  Future<void> addProdect(CartModel cartModel) async {

    // we nede Refrence to firebase
    final _prodectRef = prodectRef.collection('ORDER').doc(cartModel.tableNumber);
    cartModel.tableNumber = _prodectRef.id;
    // prodectRef.id = cartModel.tableNumber;
    final data = cartModel.toJson(); // insert to fiserbase
    _prodectRef.set(data).whenComplete(() {
      // clearController();
      Get.snackbar("", "Added successfully..");
      // Get.to(StockScreen());
      update();
    }).catchError((error) {
      Get.snackbar("Error", "something went wrong");
    });
  }




  var _product = {}.obs;

  void addFirebaseCart(Prodect prodect){

    if (productsMap.containsKey(prodect)) {
      productsMap[prodect] += 1;
    } else {
      productsMap[prodect] = 1;
    }
  }
}