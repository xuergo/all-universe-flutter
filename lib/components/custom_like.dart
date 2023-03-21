import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLikeBtn extends StatelessWidget {
  final Color color;
  const CustomLikeBtn({super.key, this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_outline_rounded,
      size: 28.w,
      color: color,
    );
  }
}
