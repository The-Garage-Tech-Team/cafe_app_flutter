
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../View/widgets/admin/popupMenu/popup_menu.dart';
import '../../../logic/Controller/prodect_controller.dart';

class FavoriteInStock extends StatelessWidget {
  List<dynamic> prodect;
  FavoriteInStock ({super.key, required this.prodect});
  final controller = Get.find<ProdectController>();

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
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  height: 156,
                  width: 99,
                  margin: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: NetworkImage('${prodect[index].imageUrl}'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "${prodect[index].productName}",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${prodect[index].category}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1)),
                          ),
                          IconButton(onPressed: (){

                           controller.deleteDataFav( '${prodect[index].productNumber}');
                          }, icon: Icon(Icons.delete)),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),

                      Row(children: [
                        Text("\$${prodect[index].price}",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                        // Spacer(),
                        // Switch(
                        //   value: true,
                        //   onChanged: (value) {},
                        //   activeTrackColor: Color.fromRGBO(67, 24, 255, 1),
                        //   activeColor: Colors.white,
                        // ),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        )
    );
  }
}
