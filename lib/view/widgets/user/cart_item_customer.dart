import 'package:cafe_app_project/View/widgets/textUtils.dart';
import 'package:cafe_app_project/logic/Controller/cart_controller.dart';
import 'package:cafe_app_project/model/product.dart';
import 'package:cafe_app_project/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/Controller/prodect_controller.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key, }) : super(key: key);

  final controller = Get.find<ProdectController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Expanded(
        child: controller.searchList.isEmpty &&
            controller.searchTextController.text.isNotEmpty
            ? Get.isDarkMode
            ? Icon(
          Icons.search_off_outlined,
          size: 150,
          color: Colors.grey,
        )
            : Icon(
          Icons.search_off_outlined,
          size: 150,
          color: Colors.white,
        )
            : GridView.builder(
          itemCount: controller.searchList.isEmpty
              ? controller.prodects.length
              : controller.searchList.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            childAspectRatio: 0.8,
            mainAxisSpacing: 9.0,
            crossAxisSpacing: 6.0,
            maxCrossAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            if (controller.searchList.isEmpty) {
              return buildCardItems(
                  catagory: controller.prodects[index].category,
                  productName: controller.prodects[index].productName,
                  image: controller.prodects[index].imageUrl,
                  price: controller.prodects[index].price,
                  productId:
                  controller.prodects[index].productNumber.toString(),
                  productModels: controller.prodects[index],
                  onTap: () {
                    // Get.to(() => ProductDetailsScreen(
                    //   productModels: controller.productList[index],
                    // ));k
                  });
            } else {
              return buildCardItems(
                  catagory: controller.searchList[index].category,
                  productName: controller.searchList[index].productName,
                  image: controller.searchList[index].imageUrl,
                  price: controller.searchList[index].price,
                  productId: controller.searchList[index].productNumber
                      .toString(),
                  productModels: controller.searchList[index],
                  onTap: () {
                    // Get.to(() => ProductDetailsScreen(
                    //   productModels: controller.searchList[index],
                    // ));
                  });
            }
          },
        ),
      );
    });
  }

  Widget buildCardItems(
  {
    required String productName,
    required String catagory,
    required String image,
    required double price,
    required String productId,
     required Prodect productModels,

    required Function() onTap,
  }
 ) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {

                       // controller.manageFavourites(productId);

                        controller.addProdectFav(productModels );
                      },
                      icon: controller.isFave(productName)
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                          : const Icon(
                        Icons.favorite_outline,
                        color: mainColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
// controller.addProdectCart(productModels);
 cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              TextUtils(
                  text: " $productName",
                  color: mainColor,
                  fontWeight: FontWeight.bold,
                  fointSize: 13),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtils(
                        text: " $catagory",
                        color: mainColor,
                        fontWeight: FontWeight.normal,
                        fointSize: 13),
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: googleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
