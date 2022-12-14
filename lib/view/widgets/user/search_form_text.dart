
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../logic/Controller/prodect_controller.dart';
import '../../../utils/theme.dart';

class SearchProducts extends StatelessWidget {
  SearchProducts({Key? key}) : super(key: key);

  final controller = Get.find<ProdectController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProdectController>(
      builder: (_) => TextField(
       controller: controller.searchTextController,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.text,
        onChanged: (searchName) {
         controller.addSearchToList(searchName);
        },
        decoration: InputDecoration(
          filled: true,
          fillColor:
          buttonColor.withOpacity(0.2),
          focusColor: Colors.red,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchTextController.text.isNotEmpty
              ? IconButton(
            onPressed: () {
              controller.clearSearch();
            },
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
            ),
          )
              : null,
          hintText: "Search with name & price",
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.grey),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: buttonColor),
            borderRadius: BorderRadius.circular(10),
          ),
          // errorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.grey),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Colors.grey),
          //   borderRadius: BorderRadius.circular(10),
          // ),
        ),
      ),
    );
  }
}
