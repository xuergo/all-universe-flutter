import 'dart:async';
import 'dart:developer';

import 'package:all_universe_flutter/global.dart';
import 'package:all_universe_flutter/model/user.dart';
import 'package:all_universe_flutter/pages/login/login_state.dart';
import 'package:all_universe_flutter/router/app_pages.dart';
import 'package:all_universe_flutter/services/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    state.phoneController.addListener(() {
      state.codeEnable = chinaPhoneNumber(state.phoneController.text);
      setLoginBtnStatus();
      update();
    });
    state.codeController.addListener(() {
      setLoginBtnStatus();
      update();
    });
  }

  @override
  void onClose() {
    log('close');
  }

  bool chinaPhoneNumber(String input) {
    if (!input.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  setLoginBtnStatus() {
    if (state.phoneController.text.length >= 3) {
      state.loginBtnEable = true;
    } else {
      state.loginBtnEable = false;
    }
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    state.timer?.cancel();
  }

  /// 启动倒计时的计时器。
  void startTimer() {
    // 计时器（`Timer`）组件的定期（`periodic`）构造函数，创建一个新的重复计时器。
    state.timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print('${state.seconds}');
      if (state.seconds == 0) {
        _cancelTimer();
        state.seconds = 20;
        state.verifyStr = '重新发送';
        state.codeEnable = true;
        update();
        return;
      }
      state.seconds--;
      state.verifyStr = '已发送${state.seconds}' + 's';
      state.codeEnable = false;
      update();
    });
  }

  chageCodeStatus() {
    if (state.codeEnable) {
      startTimer();
    }
  }

  /// 登陆
  void login() async {
    try {
      final data = {
        "phone": state.phoneController.text,
        "passWord": state.codeController.text,
      };
      EasyLoading.show(status: 'loading...');
      final UserInfo userInfo = await UserAPI.login(params: data);
      Global.saveProfile(userInfo);
      state.timer?.cancel();
      EasyLoading.dismiss();
      Get.offAllNamed(AppRoutes.Tabbar);
    } catch (e) {
      log('$e');
    }
  }
}
