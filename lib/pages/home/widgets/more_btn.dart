// 精选更多按钮
import 'dart:developer';

import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreBtn extends StatelessWidget {
  final String text;
  final Icon? icon;

  const MoreBtn({Key? key, required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => {log('more')},
        child: Container(
          width: 140.w,
          height: 35.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              if (icon != null) SizedBox(),
              SizedBox(width: 4.w),
              Text(
                text,
                style: TextStyle(
                  color: AppColors.primaryGreyText,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryGreyBackground,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
      ),
    );
  }
}
