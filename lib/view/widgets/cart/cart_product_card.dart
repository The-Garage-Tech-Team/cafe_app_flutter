
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/cart_controller.dart';
import '../../../logic/Controller/prodect_controller.dart';
import '../../../model/product.dart';
//



//  class CartProductCard extends StatelessWidget {
//    List<dynamic> prodect;
//    CartProductCard ({super.key, required this.prodect});
//    final controller = Get.find<ProdectController>();
//
//    @override
//    Widget build(BuildContext context) {
//      return ListView.builder(
//          itemCount: prodect.length,
//          itemBuilder: ((context, index) {
//            return Container(
//              margin: EdgeInsets.only(left: 20, right: 20, top: 5),
//              height: 178,
//              width: 393,
//              decoration: BoxDecoration(
//                  color: Color.fromRGBO(255, 255, 255, 1),
//                  borderRadius: BorderRadius.circular(20)),
//              child: Row(
//                children: [
//                  Container(
//                    height: 156,
//                    width: 99,
//                    margin: EdgeInsets.only(left: 15),
//                    decoration: BoxDecoration(
//                        color: Colors.white.withOpacity(0.3),
//                        borderRadius: BorderRadius.circular(4),
//                        image: DecorationImage(
//                            image: NetworkImage('${prodect[index].imageUrl}'),
//                            fit: BoxFit.cover)),
//                  ),
//                  SizedBox(
//                    width: 20,
//                  ),
//                  Expanded(
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//
//
//                        SizedBox(
//                          height: 3,
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                            Text(
//                              "${prodect[index].productName}",
//                              style: TextStyle(
//                                  fontSize: 16,
//                                  fontWeight: FontWeight.w500,
//                                  color: Color.fromRGBO(0, 0, 0, 1)),
//                            ),
//                            IconButton(onPressed: (){
//  controller.deleteDataCart('${prodect[index].productName}');
//                              // controller.deleteDataFav( '${prodect[index].productName}');
//                            }, icon: Icon(Icons.delete,color: Colors.red,)),
//                          ],
//                        ),
//                        SizedBox(
//                          height: 3,
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                            Text(
//                              "${prodect[index].category}",
//                              style: TextStyle(
//                                  fontSize: 16,
//                                  fontWeight: FontWeight.w500,
//                                  color: Color.fromRGBO(0, 0, 0, 1)),
//
//                            ),
// Row(
//   children: [
//     IconButton(
//       onPressed: () {
//          // cart.removeProductsFarmCart(productModels);
//       },
//       icon: Icon(
//         Icons.remove_circle,
//         color:  Colors.black,
//       ),
//     ),
//     Text(
//       '${  controller.orders.values}',
//       style: TextStyle(
//         overflow: TextOverflow.ellipsis,
//         color: Colors.black,
//         fontSize: 16,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     IconButton(
//       onPressed: () {
//       // controller.addProdectCart(prodect);
//       },
//       icon: Icon(
//         Icons.add_circle,
//         color: Get.isDarkMode ? Colors.white : Colors.black,
//       ),
//     ),
//   ],
// )
//
//
//                          ],
//                        ),
//                        SizedBox(
//                          height: 3,
//                        ),
//
//
//                        Row(children: [
//                          Text("\$${prodect[index].price}",
//                              style: TextStyle(
//                                  fontSize: 16,
//                                  fontWeight: FontWeight.w500,
//                                  color: Color.fromRGBO(0, 0, 0, 1))),
//                          // Spacer(),
//                          // Switch(
//                          //   value: true,
//                          //   onChanged: (value) {},
//                          //   activeTrackColor: Color.fromRGBO(67, 24, 255, 1),
//                          //   activeColor: Colors.white,
//                          // ),
//                        ]),
//                      ],
//                    ),
//                  ),
//                ],
//              ),
//            );
//          }
//          )
//      );
//    }
//  }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//





 class CartProductCard extends StatelessWidget {
  final Prodect productModels;
  final int index;
  final int quantity;
  CartProductCard({
    required this.productModels,
    required this.index,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120,
            width: 100,
            margin: const EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(productModels.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.productName,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "\$${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color:  Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFarmCart(productModels);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color:  Colors.black,
                    ),
                  ),
                  Text(
                    "$quantity",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
