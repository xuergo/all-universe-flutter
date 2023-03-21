import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSubBtn extends StatelessWidget {
  final Color color;
  const CustomSubBtn({super.key, this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 7.w, right: 7.w),
        height: 28.h,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(3.r)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.add,
              color: Colors.white,
              size: 16.w,
            ),
            SizedBox(width: 6.w),
            Text(
              '订阅',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
