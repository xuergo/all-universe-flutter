import 'package:all_universe_flutter/components/components.dart';
import 'package:all_universe_flutter/components/custom_more.dart';
import 'package:all_universe_flutter/components/custom_share.dart';
import 'package:all_universe_flutter/components/custom_sub.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 滚动之前的导航
PreferredSizeWidget BeforeAppbar(details) {
  return MyAppBar(
    centerTitle: false,
    backgroundColor: Colors.white,
    elevation: 0,
    backArrowColor: hexToColor(details.color),
    actions: [
      CustomSubBtn(color: hexToColor(details.color)),
      SizedBox(width: 15.w),
      CustomShareBtn(color: hexToColor(details.color)),
      SizedBox(width: 10.w),
      CustomMoreBtn(color: hexToColor(details.color)),
      SizedBox(width: 20.w),
    ],
  );
}
