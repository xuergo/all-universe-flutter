import 'dart:developer';

/// 编辑精选
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/pages/home/widgets/edit_selection_item.dart';
import 'package:all_universe_flutter/pages/home/widgets/more_btn.dart';
import 'package:all_universe_flutter/components/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:get/get.dart';

class EditSelection extends StatelessWidget {
  final List<PodcastModel> editSelectionList;
  EditSelection({Key? key, required this.editSelectionList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DiyTitle(
          title1: '编辑',
          title2: '精选',
          margin: EdgeInsets.symmetric(vertical: 20.h),
        ),
        ListView.builder(
          itemCount: editSelectionList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return EditSelectionItem(
              data: editSelectionList[index],
              ontap: (data) => Get.toNamed("/details"),
            );
          },
        ),
        MoreBtn(
          icon: Icon(
            Icons.calendar_month_outlined,
            color: AppColors.primaryGreyText,
            size: 26.sp,
          ),
          text: '查看往日精选',
        ),
      ],
    );
  }
}
