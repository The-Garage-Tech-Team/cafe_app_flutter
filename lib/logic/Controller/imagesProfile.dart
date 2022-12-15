import 'dart:io';
import 'dart:ui';

import 'package:cafe_app_project/logic/Controller/auth_controller.dart';
import 'package:cafe_app_project/model/UserImages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagesController extends GetxController{

  final authController = Get.put(AuthController());
   // List<File> image = [];
  String? image = "";
  final  picker = ImagePicker();


   List<UserImages> userImages =[];

  // List<UserImages> prodects =[];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
    
    
  }



  Future<void> chooseImage() async {
    final pickedImage =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    pickedFile = File(pickedImage!.path);
    print("..............");
    print(pickedFile);
    print("..............");
  }




  File? pickedFile;
  Future<void> addProdect(UserImages userImages) async {



var counter = 0;

// for (var i = 0 ;i <= image.length ;i++ ){
//   if (pickedFile == null) {
//     final ref = FirebaseStorage.instance
//         .ref()
//         .child("ok")
//         .child("kkj/${i++}");
//     await ref.putFile(pickedFile!);
//     image = (await ref.getDownloadURL()) as List<File>  ;
//   } else {
//     final ref = FirebaseStorage.instance
//         .ref()
//         .child("77")
//         .child("kkj/${i++}");
//     await ref.putFile(pickedFile!);
//     image = (await ref.getDownloadURL()) as List<File> ;
//   }
//
// }
    if (pickedFile == null) {
      final ref = FirebaseStorage.instance
          .ref()
          .child("y")
          .child("${DateTime.now()}");
      await ref.putFile(pickedFile!);
      image = (await ref.getDownloadURL())  ;
    } else {
      final ref = FirebaseStorage.instance
          .ref()
          .child("y")
          .child("${DateTime.now()}");
      await ref.putFile(pickedFile!);
      image = (await ref.getDownloadURL()) ;
    }


    DocumentReference doc =
    FirebaseFirestore.instance.collection('users').doc(authController.displayUserEmail.value).collection("ImagesUserProfile").doc();

    userImages.imageUrl = image.toString();
    final data = userImages.toJson();
    print("llllll");
    print(userImages.imageUrl);
    doc.set(data).whenComplete(() {
      // clearController();
      Get.snackbar("", "Added successfully..");
      // Get.offNamed(Routes.stockScreen);
      update();
    }).catchError((error) {
      Get.snackbar("Error", "something went wrong");
    });

  }

}


