

import 'package:cafe_app_project/view/screens/favorite_screen.dart';



import 'package:get/get.dart';




import '../../view/screens/setting/profile.dart';
import '../../view/screens/Home_Screen.dart';


class MainController  extends GetxController{
  //للنفقيشن بار
  static RxInt currentIndex = 0.obs;
  final tabs = [
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ].obs;


  final title = [
    "Brown Star",
   "favourites",
    "profile"
  ].obs;

}