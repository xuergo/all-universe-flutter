import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMoreBtn extends StatelessWidget {
  final Color color;
  const CustomMoreBtn({super.key, this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.more_horiz,
      color: color,
      size: 26.w,
    );
  }
}
