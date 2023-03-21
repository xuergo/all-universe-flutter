import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/components/custom_title.dart';
import 'package:all_universe_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TaLike extends StatelessWidget {
  final List<PodcastModel> list;
  TaLike({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DiyTitle(
            title1: 'TA们的',
            title2: '喜欢♥',
            margin: EdgeInsets.only(top: 0, left: 20.w),
          ),
          SizedBox(height: 20.h),
          Container(
            height: 230.h,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildLikeItem(list[index]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 20.w);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLikeItem(PodcastModel item) {
    return GestureDetector(
      onTap: () => Get.toNamed('/details'),
      child: Container(
        width: 290.w,
        padding: EdgeInsets.all(15.w),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: hexToColor(item.color).withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Column(
          children: [
            _buildItemHeader(item),
            SizedBox(height: 10.h),
            _buildItemContent(item),
            SizedBox(height: 10.h),
            Divider(color: hexToColor(item.color).withOpacity(0.3)),
            Spacer(),
            _buildItemBottom(item)
          ],
        ),
      ),
    );
  }

  /// 标题
  Widget _buildItemHeader(PodcastModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 头像
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(item.cover),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 15.sp,
                  ),
                ),
                Text(
                  item.time.toString(),
                  style: TextStyle(
                    color: hexToColor(item.color).withOpacity(0.3),
                    fontSize: 12.sp,
                  ),
                ),
              ],
            )
          ],
        ),

        /// ico
        Row(
          children: [
            Text(
              item.id.toString(),
              style: TextStyle(color: hexToColor(item.color), fontSize: 15.sp),
            ),
            SizedBox(width: 6.w),
            Icon(
              Icons.airplane_ticket_rounded,
              color: hexToColor(item.color),
              size: 23.sp,
            )
          ],
        ),
      ],
    );
  }

  /// 内容
  Widget _buildItemContent(PodcastModel item) {
    return SizedBox(
      child: Text(
        item.desc,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: TextStyle(
          color: hexToColor(item.color),
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 节目
  Widget _buildItemBottom(PodcastModel item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 35.w,
          height: 35.w,
          decoration: BoxDecoration(),
          child: Image.network(item.cover),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.desc,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.sp,
                  color: AppColors.primaryText,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                item.sTitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13.r,
                  color: AppColors.primaryGreyText,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10.w),
        PlayBtn(data: item),
      ],
    );
  }
}
