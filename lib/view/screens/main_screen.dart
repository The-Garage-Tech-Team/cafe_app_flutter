
import 'package:badges/badges.dart';
import 'package:cafe_app_project/logic/Controller/cart_controller.dart';
import 'package:cafe_app_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/Controller/main_controller.dart';
import '../../routes/routs.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
            () {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: Container(),
              actions: [
                Obx(
                      () => Badge(
                    position: BadgePosition.topEnd(top: 0, end: 3),
                    animationDuration: const Duration(milliseconds: 300),
                    animationType: BadgeAnimationType.slide,
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.cartScreen);
                      },
                      icon: Icon(Icons.shopping_cart,color: Colors.white,),
                    ),
                  ),


                ),
                // IconButton(
                //   onPressed: () {
                //     Get.to(prodectsFavourites());
                //   },
                //   icon: Icon(
                //
                //     Icons.favorite_border_outlined,
                //     color: Colors.black,
                //   ),
                // ),
              ],
              backgroundColor:buttonColor.withOpacity(0.8) ,
              title: Text(controller.title[controller.currentIndex.value],style: TextStyle(color: Colors.white),),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white ,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color:  buttonColor ,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  label: '',
                ),
                // BottomNavigationBarItem(
                //   activeIcon: Icon(
                //     Icons.category,
                //     color: Get.isDarkMode ? Colors.grey : googleColor,
                //   ),
                //   icon: Icon(
                //     Icons.category,
                //     color: Get.isDarkMode ? Colors.white : Colors.grey ,
                //   ),
                //   label: '',
                // ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: buttonColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey,
                  ),
                  label: '',
                ),

                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.person_pin,
                    color: buttonColor ,
                  ),
                  icon: Icon(
                    Icons.person_pin,
                    color:  Colors.grey ,
                  ),
                  label: '',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs.value,
            ),
          );
        },
      ),
    );
  }

}
//   MainScreen({Key? key}) : super(key: key);
// final controller = Get.find<MainController>();
//
//
//   // final cartController = Get.find<CartController>();
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child:Obx((){
//         return   Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             elevation: 0,
//             leading: Container() ,
//             actions: [
//               IconButton(onPressed: (){
//                 Get.toNamed(Routes.cartScreen);
//               }, icon: Icon(Icons.shopping_cart))
//             ],
//             backgroundColor: mainColor,
//             title: Text(controller.title[controller.currentIndex.value]),
//             centerTitle: true,
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             currentIndex: controller.currentIndex.value,
//             // backgroundColor: ,
//             type: BottomNavigationBarType.fixed,
//
//             items: [
//
//               BottomNavigationBarItem(
//                 activeIcon: Icon(Icons.home,
//
//                   color: mainColor,),
//                 icon: Icon(Icons.home,
//                   color: Colors.grey,),
//                 label: "",
//               ),
//
//
//               BottomNavigationBarItem(
//                 activeIcon: Icon(Icons.favorite,
//
//                   color: mainColor,),
//                 icon: Icon(Icons.favorite,
//                   color: Colors.grey,),
//                 label: "",
//               ),
//
//               BottomNavigationBarItem(
//                 activeIcon: Icon(Icons.person_off,
//
//                   color: mainColor,),
//                 icon: Icon(Icons.person_off,
//                   color: Colors.grey,),
//                 label: "",
//               ),
//
//
//               //  -----------------------
//
//
//               BottomNavigationBarItem(
//                 activeIcon: Icon(Icons.category,
//
//                   color: mainColor,),
//                 icon: Icon(Icons.person_off,
//                   color: Colors.grey,),
//                 label: "",
//               ),
//
//               //  ----------------------
//             ],
//             onTap:(index){
//               controller.currentIndex.value = index;
//
//
//             } ,
//           ),
//           body: IndexedStack(
//             index: controller.currentIndex.value,
//             children: controller.tabs.value
//           ) ,
//         );
//
//         })
//
//     );
//   }}






//
//
//       SafeArea(
//         child: Obx ((){
//
//           return Scaffold(
//             backgroundColor: context.theme.backgroundColor,
//             appBar: AppBar(
//               elevation: 0,
//               leading: Container(),
//               actions: [
//
//
//
//                 // Obx(() =>
//                 //     Badge(
//                 //         position: BadgePosition.topEnd(top: 0, end: 3),
//                 //         animationDuration: Duration(milliseconds: 300),
//                 //         animationType: BadgeAnimationType.slide,
//                 //         badgeContent:   Text(
//                 //           cartController.quantity().toString(),
//                 //           style: const  TextStyle(color: Colors.white),
//                 //         ),
//                 //         child:  IconButton(
//                 //             onPressed: () {
//                 //               Get.toNamed(Routes.cartScreen);
//                 //             }, icon:
//                 //         Image.asset("assets/images/shop.png")
//                 //         )),),
//                 //
//
//               ],
//               backgroundColor:Get.isDarkMode?  darkGreyClr :  mainColor,
//               // titleعشان الاب بار يتغير مع النفيقيشن بار ويجي السم الصفحه نفسه
//               // title: Text(controller.title[controller.currentIndex.value]),
//               centerTitle: true,
//             ),
//
//             //لعمل النفقيشن بار
//             bottomNavigationBar: BottomNavigationBar(
//               backgroundColor: Get.isDarkMode? darkGreyClr : Colors.white,
//               // currentIndex: controller.currentIndex.value,
//               type: BottomNavigationBarType.fixed,
//               items: [
//                 BottomNavigationBarItem(
//                     activeIcon: Icon(Icons.home,
//                         color: Get.isDarkMode? pinkClr :  mainColor) ,
//                     icon:Icon(Icons.home,
//                         color: Get.isDarkMode? Colors.white : Colors.black
//                     ),
//                     label: ''),
//
//                 BottomNavigationBarItem(
//                     activeIcon: Icon(Icons.category,
//                         color: Get.isDarkMode? pinkClr :  mainColor) ,
//                     icon:Icon(Icons.category,
//                         color: Get.isDarkMode? Colors.white : Colors.black
//                     ),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     activeIcon: Icon(Icons.favorite,
//                         color: Get.isDarkMode? pinkClr :  mainColor) ,
//                     icon:Icon(Icons.favorite,
//                         color: Get.isDarkMode? Colors.white : Colors.black
//                     ),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     activeIcon: Icon(Icons.settings,
//                         color: Get.isDarkMode? pinkClr :  mainColor) ,
//                     icon:Icon(Icons.settings,
//                         color: Get.isDarkMode? Colors.white : Colors.black
//                     ),
//                     label: ''),
//               ],
//               onTap: (index){
//                 // controller.currentIndex.value = index;
//               } ,
//             ),
//             body: IndexedStack(
//               // index: controller.currentIndex.value,
//              // / children: controller.tabs.value,
//             ),
//           );
//         }
//
//         )
//     );
//   }
// }
