







import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../View/widgets/admin/popupMenu/popup_menu.dart';
import '../../../logic/Controller/imagesProfile.dart';

class ImageUserProfile extends StatelessWidget {
  List<dynamic> prodect;
  ImageUserProfile ({super.key, required this.prodect});
  final controller = Get.find<ImagesController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: prodect.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 5),
            height: 178,
            width: 393,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(20)
            ,
                image: DecorationImage(
                    image: NetworkImage('${prodect[index].imageUrl}'),
                    fit: BoxFit.fill)),
            // child: Row(
            //   children: [
            //     Container(
            //       height: 156,
            //       width: 250,
            //       margin: EdgeInsets.only(left: 15),
            //       decoration: BoxDecoration(
            //           color: Colors.white.withOpacity(0.3),
            //           borderRadius: BorderRadius.circular(4),
            //           image: DecorationImage(
            //               image: NetworkImage('${prodect[index].imageUrl}'),
            //               fit: BoxFit.cover)),
            //     ),
            //
            //
            //   ],
            // ),
          );
        }
        )
    );
  }
}