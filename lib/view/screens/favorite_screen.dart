
import 'package:cafe_app_project/View/widgets/admin/stock/empty_screen.dart';
import 'package:cafe_app_project/View/widgets/textUtils.dart';
import 'package:cafe_app_project/logic/Controller/auth_controller.dart';
import 'package:cafe_app_project/logic/Controller/prodect_controller.dart';
import 'package:cafe_app_project/utils/theme.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../model/product.dart';
import '../widgets/favorite/favWidget.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final controller = Get.put(ProdectController());
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(authController.displayUserEmail.value).collection("Favorite").snapshots(),


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
                return Center(child: TextUtils(text: 'empty Favorite ♡', fointSize: 30, fontWeight: FontWeight.bold,color: buttonColor,));
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
//
//       Obx(
//             () => Scaffold(
//             body: controller.favouritesList.isNotEmpty
//                 ? ListView.builder(
//                 itemCount: controller.favouritesList.length,
//                 itemBuilder: ((context, index) {
//                   return Container(
//                     margin: EdgeInsets.only(left: 20, right: 20, top: 5),
//                     height: 138,
//                     width: 393,
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(255, 255, 255, 1),
//                         borderRadius: BorderRadius.circular(20)),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 106,
//                           width: 96,
//                           margin: EdgeInsets.only(left: 15),
//                           decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(4),
//                               image: DecorationImage(
//                                   image: NetworkImage(
//                                       '${controller.favouritesList[index].imageUrl}'),
//                                   fit: BoxFit.cover)),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         Expanded(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "${controller.favouritesList[index].productName}",
//                                       style: TextStyle(
//                                           overflow: TextOverflow.ellipsis,
//                                           fontSize: 12,
//                                           fontWeight: FontWeight.w700),
//                                     ),
//                                     Spacer(),
//                                     // PopupMenu1(),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 3,
//                               ),
//                               Text(
//                                 "${controller.favouritesList[index].category}",
//                                 style: TextStyle(
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w300,
//                                     color: Color.fromRGBO(0, 0, 0, 1)),
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               SizedBox(
//                                 height: 4,
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                               Row(children: [
//                                 Text(
//                                     "\$${controller.favouritesList[index].price}",
//                                     style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.w500,
//                                         color: Color.fromRGBO(0, 0, 0, 1))),
//                                 // Spacer(),
//                               ]),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }))
//                 : EmptyScreen()));
//   }
// }
//
