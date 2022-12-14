


import 'package:cafe_app_project/model/order_model.dart';
import 'package:cafe_app_project/model/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {


  var _products= {}.obs;
  //
  // final Rx<OrderModel> orderModel =
  // OrderModel(nameOrder: "",
  //   note: "",
  //   tableNumber: "",
  //   price: 0,
  //   isfavorite: false,
  //   quantity: 0,
  // ) as Rx<OrderModel>;
  //
  //

addProdect(Prodect prodect) {
  if (_products.containsKey(prodect)) {
    _products[prodect] += 1;
  } else {
    _products[prodect] = 1;
  }
  Get.snackbar(
      "title"
      ,"nnnn  ${prodect.productName}",
       snackPosition: SnackPosition.BOTTOM,);
}

  }













