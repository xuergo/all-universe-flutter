import 'dart:developer';

import 'package:all_universe_flutter/global.dart';
import 'package:all_universe_flutter/router/app_pages.dart';
import 'package:get/get.dart';

class IndexController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    startCountdownTimer();
  }

  @override
  void onClose() {}

  // 展示欢迎页，倒计时1.5秒之后进入应用
  Future startCountdownTimer() async {
    await Future.delayed(Duration(milliseconds: 1000), () {
      if (Global.isOfflineLogin) {
        Get.toNamed(AppRoutes.Tabbar);
      } else {
        Get.offAllNamed(AppRoutes.Tabbar);
      }
    });
  }
}
