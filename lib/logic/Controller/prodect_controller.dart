


  import 'dart:io';

import 'package:cafe_app_project/logic/Controller/auth_controller.dart';
import 'package:cafe_app_project/logic/Controller/cart_controller.dart';
import 'package:cafe_app_project/model/product.dart';
import 'package:cafe_app_project/routes/routs.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';


class ProdectController extends GetxController {

  // var isLoading = true.obs;
  // var stoarge = GetStorage();
  final authController = Get.put(AuthController());
  final cartController = Get.put(CartController());
  var isCatgeoryLoading = false.obs;
  late TextEditingController
  productNumberController,
      productNameControlller,
      productCategoryController,
      productQuantityController,
      productPriceController,
      productDescriptionController;


  TextEditingController searchTextController = TextEditingController();

  // final prodectRef = FirebaseFirestore.instance.collection('prodects');


  File? pickedFile;
  String imgUrl = "";
  final imagePicker = ImagePicker();

  final prodectRefUser = FirebaseFirestore.instance.collection('users');
  final getData = FirebaseFirestore.instance.collection('prodects').snapshots();

  List<Prodect> prodects = [];
  var searchList = <Prodect>[].obs;
 var carts = <CartModels>[].obs;
  var prodectsFav =<Prodect> [];
  //update varible
  var productName = ''.obs;
  var productCategory = ''.obs;
  var productQuantity = ''.obs;
  var productPrice = ''.obs;
  var productDescription = ''.obs;


  List <String> imageListSlider = [
    "https://images.unsplash.com/photo-1592663527359-cf6642f54cff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGNvb2ZmZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1559496417-e7f25cb247f3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGNvb2ZmZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1572286258217-40142c1c6a70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGNvb2ZmZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
    "https://images.unsplash.com/photo-1520903304654-28bd223f96d7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8Mnw3NDk0MzIwN3x8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60"
  ];

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    productNumberController = TextEditingController();
    productNameControlller = TextEditingController();
    productCategoryController = TextEditingController();
    productQuantityController = TextEditingController();
    productPriceController = TextEditingController();
    productDescriptionController = TextEditingController();
    // TODO: implement initState

  }


  // add to firebase


  Future<void> addProdect(Prodect prodect) async {
    if (pickedFile == null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productNameControlller.text + ".jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    } else {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productNameControlller.text + ".jpg");
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }
    // we nede Refrence to firebase
    final prodectRef = FirebaseFirestore.instance.collection('prodects').doc();
    prodect.productNumber = prodectRef.id;
    prodect.imageUrl = imgUrl.toString();
    final data = prodect.toJson(); // insert to fiserbase
    prodectRef.set(data).whenComplete(() {
      clearController();
      Get.snackbar("", "Added successfully..");
      Get.offNamed(Routes.stockScreen);
      update();
    }).catchError((error) {
      Get.snackbar("Error", "something went wrong");
    });
  }

  Future<void> TakePhoto(ImageSource sourse) async {
    final pickedImage =
    await imagePicker.pickImage(source: sourse, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    print("..............");
    print(pickedFile);
    print("..............");
  }

  // update on firebase

  Future<void> updateProduct(productNumberController,
      productNameControlller,
      productCategoryController,
      productQuantityController,
      productPriceController,
      productDescriptionController,
      imgUrl) async {
    productName.value = productNameControlller.text;
    productCategory.value = productCategoryController.text;
    productQuantity.value = productQuantityController.text;
    productPrice.value = productPriceController.text;
    productDescription.value = productDescriptionController.text;
    imgUrl;

    final ref = FirebaseStorage.instance
        .ref()
        .child("productImage")
        .child(productNameControlller.text + ".jpg");
    if (pickedFile == null) {} else {
      await ref.putFile(pickedFile!);
      imgUrl = await ref.getDownloadURL();
    }

    final docProduct = FirebaseFirestore.instance
        .collection("prodects")
        .doc(productNumberController);
    docProduct.update({
      "productName": productName.value,
      "category": productCategory.value,
      "quantity": int.parse(productQuantity.value),
      "price": double.parse(productPrice.value),
      "description": productDescription.value,
      "imageUrl": imgUrl.toString(),
    }).whenComplete(() {
      print("update done");
      Get.snackbar("", "Update successfully..");
      clearController();
      update();
      Get.offNamed(Routes.stockScreen);
    });
  }

  // delete on firebase
  Future<void> deleteData(productNumberController,
      productNameControlller) async {
    await FirebaseFirestore.instance
        .collection('prodects')
        .doc(productNumberController)
        .delete()
        .whenComplete(() async {
      Get.snackbar("", "Delete successfully..");
      print("delete ${productNumberController}");

      FirebaseStorage.instance
          .ref()
          .child("productImage/")
          .child(productNameControlller + ".jpg")
          .delete()
          .whenComplete(() => print("image delete"));
    });
  }

  // clear Controller
  void clearController() {
    productNameControlller.clear();
    productCategoryController.clear();
    productQuantityController.clear();
    productPriceController.clear();
    productDescriptionController.clear();
    pickedFile = null;
  }

  // var favouritesList = <Prodect>[].obs;
  // List<dynamic> prodectsFavourites = [];
  // var cartListcartList = <CartModels>[].obs;

  // void manageFavourites(String productId) async {
  //
  // }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = prodects.where((search) {
      var searchTitle = search.productName.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }


//


var id  ;
  Future<void> addProdectFav(Prodect prodect) async {


    var indexWanted = prodectsFav.indexWhere((element) {
      print("-----------------nnn${element.productNumber}");
      return element.productNumber == prodect.productNumber;
    });
    print("-------------nn ${prodect.productNumber}");
    print(indexWanted);

    print("------------nn-");

    if (indexWanted >= 0) {
      // final refs = FirebaseStorage.instance
      //     .ref()
      //     .child("productImage")
      //     .child(productNameControlller.text + ".jpg");
      await prodectRefUser.doc(authController.displayUserEmail.value).collection(
          "Favorite").doc(prodect.productNumber).delete();

      Get.snackbar("", "deleted successfully..");
     // Get.toNamed(Routes.cartScreen);
    } else {
      final ref = FirebaseStorage.instance
          .ref()
          .child("productImage")
          .child(productNameControlller.text + ".jpg");
      final comicRef = prodectRefUser
          .doc(authController.displayUserEmail.value)
          .collection("Favorite")
          .doc(prodect.productNumber);
      prodect.productNumber = comicRef.id;
      id = prodect.productNumber;
      final data = prodect.toJson(); // insert to fiserbase
      print("----- ${comicRef.id}");
      print("------------- ${prodect.productNumber}");

      comicRef.set(data).whenComplete(() {
        if (comicRef.id == prodect.productNumber.toString()) {
          Get.snackbar("", "Added successfully..");
          // Get.toNamed(Routes.cartScreen);
        } else {
          Get.snackbar("Error", "something went wrong");
        }
        update();
      }
      )
          .catchError((error) {
        Get.snackbar("Error", "something went wrong");
      });
    }





  }

  bool isFave(String productId) {
    print("------&&&&&&$productId");
print(productNumberController.text);

    return prodectsFav.any((element) =>
      element.productNumber == productId);

  }


  Future<void> deleteDataFav(String nameId) async {
    await prodectRefUser.doc(authController.displayUserEmail.value).collection(
        "Favorite").doc(nameId).delete();
  }



 var orders = {}.obs;


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
      // Get.toNamed(Routes.mainScreen);
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
          // Get.toNamed(Routes.mainScreen);
        } else {
          Get.snackbar("Error", "something went wrong");
        }
      }).catchError((error) {
        Get.snackbar("Error", "something went wrong");
      });
    }
    // final ref = FirebaseStorage.instance
    //     .ref()
    //     .child("productImage")
    //     .child(productNameControlller.text + ".jpg");
    // var refs = FirebaseFirestore.instance.collection('users').doc(
    //     authController.displayUserEmail.value).collection("cart").doc(
    //     prodect.productName);
    //
    // prodect.productNumber = prodectRef.id;
    // // prodect.imageUrl = imgUrl.toString();
    // final data = prodect.toJson(); // insert to fiserbase
    // refs.set(data).whenComplete(() {
    //   clearController();
    //   Get.snackbar("", "Added successfully..");
    //   if (orders.containsKey(prodect)) {
    //     orders[prodect] += 1;
    //   } else {
    //     // Get.snackbar("Error", "Somthing went wrong ");
    //     orders[prodect] = 1;
    //   }
    //
    //
    //   // Get.offNamed(Routes.stockScreen);
    //   update();
    // }).catchError((error) {
    //   Get.snackbar("Error", "something went wrong");
    // });
  }


  Future<void> deleteDataCart(String nameId) async {
    await prodectRefUser.doc(authController.displayUserEmail.value).collection(
        "cart").doc(nameId).delete();
  }

  // get productSubTotal =>
  //     orders.entries.map((e) => e.key.price * e.value).toList();

  // get total =>
  //     orders.entries
  //         .map((e) => e.key.price * e.value)
  //         .toList()
  //         .reduce((value, element) => value + element)
  //         .toStringAsFixed(2);
  //
  //
  // int quantity() {
  //   if (orders.isEmpty) {
  //     return 0;
  //   } else {
  //     return orders.entries
  //         .map((e) => e.value)
  //         .toList()
  //         .reduce((value, element) => value + element);
  //   }
  // }


}