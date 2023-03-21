import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
        color: AppColors.primaryGreyBackground,
        borderRadius: BorderRadius.all(Radius.circular(6.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppColors.primaryGreyText,
              size: 26.sp,
            ),
            Expanded(
              child: Text(
                '掘金开发者大会',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryGreyText,
                ),
              ),
            ),
            Icon(
              Icons.qr_code_scanner_rounded,
              color: AppColors.primaryGreyText,
              size: 26.sp,
            )
          ],
        ),
      ),
    );
  }
}
