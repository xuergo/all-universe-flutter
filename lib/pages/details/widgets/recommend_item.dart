import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendItem extends StatelessWidget {
  final PodcastModel data;
  const RecommendItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: 11.sp,
      color: AppColors.primaryGreyText,
    );
    return Container(
      margin: EdgeInsets.only(right: 40.w),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            child: Container(
              width: 60.h,
              height: 60.h,
              child: MyCachedNetworkImage(
                imageurl: data.cover,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.desc,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      data.name,
                      style: textStyle,
                    ),
                    Spacer(),
                    Icon(
                      Icons.thumb_up,
                      size: 15.w,
                      color: AppColors.primaryGreyText,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '34',
                      style: textStyle,
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.message,
                      size: 15.w,
                      color: AppColors.primaryGreyText,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '134',
                      style: textStyle,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
