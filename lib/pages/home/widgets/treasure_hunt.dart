import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TreasureHunt extends StatelessWidget {
  final List<PodcastModel> list;
  const TreasureHunt({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.all(10.w),
      child: Container(
        height: 250.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.primaryGreyText,
            width: .2.w,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(25),
              offset: const Offset(0, 10),
              blurRadius: 20,
              spreadRadius: 0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage('lib/assets/images/home/xn.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            /// 标题
            _buildTitle(),
            SizedBox(height: 12.h),

            /// 节目
            _buildContent()
          ],
        ),
      ),
    );
  }

  /// 标题
  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '播客寻宝',
            style: TextStyle(
              fontSize: 22.sp,
              color: AppColors.primaryColor,
              height: 1.1,
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 25.w,
            height: 25.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.r),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor,
                  Colors.amber.shade100,
                ],
              ),
            ),
            child: Text(
              '29',
              style: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                '查看完整内容',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.primaryGreyText,
                  height: 1.1,
                ),
              ),
              SizedBox(width: 8.w),
              Icon(
                Icons.arrow_forward,
                size: 15.sp,
                color: AppColors.primaryGreyText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// 内容
  Widget _buildContent() {
    return Expanded(
      child: ListView.separated(
        itemCount: list.length,
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _buildContentItem(list[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: 15.w);
        },
      ),
    );
  }

  /// 单个内容
  Widget _buildContentItem(PodcastModel item) {
    return GestureDetector(
      onTap: () => Get.toNamed('/details', arguments: {'data': item}),
      child: Container(
        width: 110.w,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110.w,
              height: 110.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0.r)),
              ),
              child: MyCachedNetworkImage(
                imageurl: '${item.cover}',
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '${item.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 1.h),
            Text(
              '${item.desc}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.primaryGreyText,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
