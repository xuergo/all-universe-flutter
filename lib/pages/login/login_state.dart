import 'dart:async';

import 'package:flutter/material.dart';

class LoginState {
  TextEditingController phoneController = TextEditingController(text: 'admin');
  TextEditingController codeController = TextEditingController(text: '123');

  bool codeEnable = true;
  bool loginBtnEable = true;
  String verifyStr = '获取验证码';

  Timer? timer;
  int seconds = 20;

  LoginState() {}
}
