import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../View/widgets/admin/popupMenu/popup_menu.dart';
import '../../../logic/Controller/imagesProfile.dart';

class ImageUserProfile extends StatelessWidget {
  List<dynamic> prodect;
  ImageUserProfile({super.key, required this.prodect});
  final controller = Get.find<ImagesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: prodect.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.7,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 1.0,
          maxCrossAxisExtent: 160,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
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
                  Container(
                    width: double.infinity,
                    height: 140,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      '${prodect[index].imageUrl}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
