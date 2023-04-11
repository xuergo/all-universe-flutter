import 'dart:async';
import 'package:all_universe_flutter/common/values/values.dart';
import 'package:all_universe_flutter/global.dart';
import 'package:all_universe_flutter/router/app_pages.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:get/get.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var profileJSON = LoacalStorage().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 删除缓存token
Future deleteAuthentication() async {
  await LoacalStorage().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

/// 重新登录
void deleteTokenAndReLogin() async {
  await deleteAuthentication();
  Get.offAllNamed(AppRoutes.Splash);
}
