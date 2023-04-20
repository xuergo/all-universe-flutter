import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 顶部标题
class TopTitle extends StatelessWidget {
  final String title;
  final Widget widget;
  TopTitle(this.title, this.widget);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        widget
      ],
    );
  }
}

//单个大标题
class DiyTitle extends StatelessWidget {
  final String? title1;
  final String? title2;
  final EdgeInsets margin;

  const DiyTitle({
    this.title1,
    this.title2,
    this.margin = const EdgeInsets.only(top: 0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        children: [
          if (title1 != null && title1!.isNotEmpty)
            Opacity(
              opacity: 0.4,
              child: Text(
                '$title1 ',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          Text(
            '$title2',
            style: TextStyle(
              fontSize: 20.sp,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}
