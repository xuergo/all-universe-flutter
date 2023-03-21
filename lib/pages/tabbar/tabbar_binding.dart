import 'dart:developer';

import 'package:all_universe_flutter/pages/tabbar/tabbar_controller.dart';
import 'package:get/get.dart';

class TabbarBinding extends Bindings {
  @override
  void dependencies() {
    log("---tabbar");
    Get.lazyPut<TabbarController>(() => TabbarController());
  }
}
