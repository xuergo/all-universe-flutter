// 分组数组
import 'dart:ui';

import 'package:all_universe_flutter/pages/play/play_list_view.dart';
import 'package:all_universe_flutter/pages/play/play_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

List<List<T>> getSplitList<T>(List<T> list, int len) {
  if (len <= 1) {
    return [list];
  }

  List<List<T>> result = [];
  int index = 1;

  while (true) {
    if (index * len < list.length) {
      List<T> temp = list.skip((index - 1) * len).take(len).toList();
      result.add(temp);
      index++;
      continue;
    }
    List<T> temp = list.skip((index - 1) * len).toList();
    result.add(temp);
    break;
  }
  return result;
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

/// 跳转播放页面
void toPlayPage() {
  Get.bottomSheet(
    PlayPage(),
    barrierColor: Colors.black.withOpacity(.2),
    enterBottomSheetDuration: const Duration(milliseconds: 200),
    exitBottomSheetDuration: const Duration(milliseconds: 200),
    enableDrag: true,
    isScrollControlled: true,
  );
}

/// 跳转播放列表
void toPlayListPage(BuildContext context) {
  showBarModalBottomSheet(
    expand: true,
    context: context,
    topControl: SizedBox(),
    backgroundColor: Colors.white,
    builder: (context) => PlayListPage(),
  );
}
