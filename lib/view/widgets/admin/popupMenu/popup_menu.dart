import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../logic/Controller/prodect_controller.dart';
import '../../../../model/menu_items.dart';
import '../../../../model/modelMenu_item.dart';
import '../../../Screens/admin/edit_product_screen.dart';

class PopupMenu extends StatelessWidget {
  String prodectId;
  String productName;
  String category;
  String quantity;
  String price;
  String description;
  String imageUrl;

  PopupMenu(
      {super.key,
      required this.prodectId,
      required this.productName,
      required this.category,
      required this.quantity,
      required this.price,
      required this.description,
      required this.imageUrl});
  final controller = Get.find<ProdectController>();
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuItemPoup>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (item) {
          onSelected(context, item);
        },
        itemBuilder: (context) => [
              ...MenuItems.menuItems.map(buildItem).toList(),
            ]);
  }

  PopupMenuItem<MenuItemPoup> buildItem(MenuItemPoup item) => PopupMenuItem(
      value: item,
      child: Container(
        width: 147,
        height: 64,
        child: Row(
          children: [
            Icon(item.icon),
            Text(" "),
            Text(
              item.text,
              style: TextStyle(color: item.color),
            )
          ],
        ),
      ));

  void onSelected(BuildContext context, MenuItemPoup item) {
    switch (item) {


      case MenuItems.itemDelete:
        controller.deleteDataFav(productName);
        break;
    }
  }
}
