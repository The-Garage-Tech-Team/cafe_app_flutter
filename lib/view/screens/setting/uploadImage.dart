




import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../View/widgets/textUtils.dart';
import '../../../logic/Controller/imagesProfile.dart';
import '../../../model/UserImages.dart';
import '../../../utils/theme.dart';

class UplodImageProfile extends StatelessWidget {
   UplodImageProfile({Key? key}) : super(key: key);
  final controllerImages = Get.put(ImagesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Upload Image ',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [

          TextButton(onPressed: () async{

            controllerImages.addProdect(UserImages(imageUrl: controllerImages.image !));
          }

              , child: TextUtils(text: "save", color: Colors.green, fontWeight: FontWeight.w700, fointSize: 12))

        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Center(
          child: Container(

            child : IconButton(onPressed: (){
              controllerImages.chooseImage();
            }, icon: Icon(Icons.add_a_photo ,color: buttonColor,),),

          ),
        ),
      ),
    );
  }
}
