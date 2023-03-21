import 'package:all_universe_flutter/components/components.dart';
import 'package:all_universe_flutter/components/custom_share.dart';
import 'package:all_universe_flutter/components/custom_sub.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 滚动之后的导航
PreferredSizeWidget AfterAppbar(details) {
  return MyAppBar(
    centerTitle: false,
    backgroundColor: Colors.white,
    backArrowColor: hexToColor(details.color),
    elevation: 0,
    title: Row(
      children: [
        Container(
          width: 30.w,
          height: 30.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(details.cover),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(3.r)),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            details.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    ),
    actions: [
      CustomSubBtn(color: hexToColor(details.color)),
      SizedBox(width: 15.w),
      CustomShareBtn(color: hexToColor(details.color)),
      SizedBox(width: 10.w),
    ],
  );
}
