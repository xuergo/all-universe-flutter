import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/pages/play/play_controller.dart';
import 'package:all_universe_flutter/pages/play/widgets/play_list_btn.dart';
import 'package:all_universe_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 底部播放栏
class BottomPlayBarPage extends GetView<PlayController> {
  BottomPlayBarPage({Key? key}) : super(key: key);

  final controller = Get.find<PlayController>();
  final state = Get.find<PlayController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayController>(
      builder: (_) => Container(
        child: GestureDetector(
          onTap: () => toPlayPage(),
          child: Container(
            width: double.infinity,
            height: 60.h,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 8.h,
            ),
            child: Row(
              children: [
                /// 封面
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.network(
                    state.playData!.cover,
                    height: 44.h,
                    width: 44.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10.w),

                /// 标题&时间
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.playData!.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        '${state.time}/${state.totalTime}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.primaryGreyText,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10.w),
                PlayBtn(data: state.playData),
                SizedBox(width: 10.w),
                PlayListBtn()
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(0, -7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
