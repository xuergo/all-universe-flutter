import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:all_universe_flutter/pages/Index/Index_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IndexPage extends StatelessWidget {
  IndexPage({Key? key}) : super(key: key);
  final controller = Get.put(IndexController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Image(
            image: AssetImage('lib/assets/images/common/logo.png'),
            width: 200.w,
          ),
          SizedBox(height: 10.h),
          Text(
            '😂大宇宙😂',
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 20.sp,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
