import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomShareBtn extends StatelessWidget {
  final Color color;
  const CustomShareBtn({super.key, this.color = AppColors.primaryColor});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.share,
      size: 25.w,
      color: color,
    );
  }
}
