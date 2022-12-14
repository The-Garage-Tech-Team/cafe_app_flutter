
 import 'package:cafe_app_project/logic/Controller/cart_controller.dart';
import 'package:cafe_app_project/model/product.dart';
import 'package:cafe_app_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
//   const CartProductCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 20,right: 20 ,top: 5),
//       height: 130,
//       width: 100,
//
//       decoration: BoxDecoration(
//         color: mainColor.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(20),
//
//       ),
//       child: Row(
//         children: [
//           Container(
//             height: 120,
//             width: 100,
//             margin:  EdgeInsets.only(left: 15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               image: DecorationImage(
//                 image: NetworkImage("https://images.unsplash.com/photo-1670782017454-69e7f95fd78a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=800&q=60" ),
//                   fit :BoxFit.cover,
//               ),
//
//
//               ),
//             ),
//           SizedBox(width: 20,),
//    Expanded(
//      flex: 15,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: [
//          Text("cooffe" ,
//          style: TextStyle(
//            overflow: TextOverflow.ellipsis,
//          ),),
//          SizedBox(height: 20,),
//          Text("\$30" ,
//            style: TextStyle(
//              overflow: TextOverflow.ellipsis,
//            ),),
//        ],
//      ),
//    ),
//
//           Row(
//             children: [
//               IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle,
//               color: mainColor,),),
//               Text("1"),
//               IconButton(onPressed: (){}, icon: Icon(Icons.add_circle ,
//               color: mainColor,)),
//
//
//
//             ],
//           ),
// IconButton(onPressed: (){}, icon:Icon(Icons.delete))
//
//         ],
//       ),
//
//     );
//   }
// }
