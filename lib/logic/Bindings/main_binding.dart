


import 'package:get/get.dart';

import '../Controller/main_controller.dart';

class MainBindng extends Bindings{
  @override
  void dependencies() {
    Get.put(MainController());
    // Get.put(SettingController());
    // TODO: implement dependencies
  }


}