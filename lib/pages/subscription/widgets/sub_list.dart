import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubList extends StatelessWidget {
  final List<PodcastModel> list;
  SubList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildSubItem(list[index]);
        },
        childCount: list.length,
      ),
    );
  }

  Widget _buildSubItem(PodcastModel data) {
    final TextStyle _textStyle = TextStyle(
      color: AppColors.primaryGreyText,
      fontSize: 10.sp,
    );
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 封面
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Container(
              width: 55.w,
              height: 55.w,
              child: MyCachedNetworkImage(imageurl: data.cover),
            ),
          ),
          SizedBox(width: 20.w),

          /// 描述
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 标题
                Text(
                  data.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 5.h),

                ///描述
                Text(
                  data.desc,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.primaryGreyText,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h),

                /// 时间
                Row(
                  children: [
                    Text(
                      '14分钟 · 4个小时前 · ',
                      style: _textStyle,
                    ),
                    Icon(
                      Icons.headphones,
                      color: AppColors.primaryGreyText,
                      size: 12.w,
                    ),
                    Text(
                      ' 4687 · ',
                      style: _textStyle,
                    ),
                    Icon(
                      Icons.message,
                      color: AppColors.primaryGreyText,
                      size: 12.w,
                    ),
                    Text(
                      ' 119',
                      style: _textStyle,
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                /// 操作
                Row(
                  children: [
                    Icon(
                      Icons.format_list_bulleted_add,
                      color: AppColors.primaryColor,
                      size: 25.w,
                    ),
                    SizedBox(width: 20.w),
                    Icon(
                      Icons.message_outlined,
                      color: AppColors.primaryColor,
                      size: 25.w,
                    ),
                    SizedBox(width: 20.w),
                    Icon(
                      Icons.more_horiz_outlined,
                      color: AppColors.primaryColor,
                      size: 25.w,
                    ),
                    Spacer(),
                    PlayBtn(
                      data: data,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
