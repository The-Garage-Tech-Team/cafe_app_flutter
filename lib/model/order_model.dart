

import 'dart:convert';


CartModel prodectFromJson(String str) => CartModel.fromJson(json.decode(str));

String prodectToJson(CartModel data) => json.encode(data.toJson());


class CartModel {


  String? tableNumber;
  String? nameOrder;
  String? note ;
  bool? isfavorite;
 int? quantity;
 double? price;

  CartModel({
    this.tableNumber,
    this.nameOrder,
    this.note,
    this.quantity,
    this.price,
    this.isfavorite
  });



  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(


      tableNumber : json['id'],
      nameOrder : json['name'],
      note : json['note'],
      isfavorite : json['isFavorite'],
      quantity : json['quantity'],
      price : json['price'],

  );



  Map<String, dynamic> toJson() {
    return {
      'id': tableNumber,
      'name': nameOrder,
      'note': note,
      'isFavorite': isfavorite,
      'quantity': quantity,
      'price' : price,

    };
  }
}