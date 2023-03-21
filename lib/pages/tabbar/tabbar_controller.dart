import 'dart:developer';

import 'package:all_universe_flutter/pages/tabbar/tabbar_state.dart';
import 'package:get/get.dart';

class TabbarController extends GetxController {
  final TabbarState state = TabbarState();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void changeTabbar(int value) {
    state.selectIndex = value;
    update();
  }
}
