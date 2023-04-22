import 'dart:developer';

import 'package:all_universe_flutter/pages/splash/splash_state.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final SplashState state = SplashState();

  @override
  void onInit() async {
    super.onInit();
    updateShow();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  updateShow() async {
    await Future.delayed(Duration(seconds: 1));
    state.isShow = true;
    update();
  }
}
