import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/pages/play/play_controller.dart';
import 'package:all_universe_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayListBtn extends StatelessWidget {
  PlayListBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayController>(
      builder: (_) => GestureDetector(
        onTap: () {
          toPlayListPage(context);
        },
        child: Container(
          padding: EdgeInsets.all(5.w),
          child: Icon(
            Icons.line_style_rounded,
            size: 22.w,
            color: AppColors.primaryColor,
          ),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.08),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
