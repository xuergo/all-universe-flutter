import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// 单个播客组件
class PodcastItem extends StatelessWidget {
  final PodcastModel data;
  final String? type;

  const PodcastItem({super.key, required this.data, this.type = 'sTitle'});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/details'),
      child: Container(
        height: 90.r,
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 90.r,
              child: MyCachedNetworkImage(imageurl: data.cover),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryGreyText,
                    ),
                  ),
                  Text(
                    data.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "“ ${type == 'sTitle' ? '${data.name}' : '${data.sTitle} 分钟'} ",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: AppColors.primaryGreyText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            PlayBtn(data: data),
          ],
        ),
      ),
    );
  }
}
