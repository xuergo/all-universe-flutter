import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/pages/home/widgets/podcast_item.dart';
import 'package:all_universe_flutter/components/custom_title.dart';
import 'package:all_universe_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fraternity extends StatelessWidget {
  final List<PodcastModel> list;
  Fraternity({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    List<List<PodcastModel>> swiperList = getSplitList(list, 3);
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DiyTitle(
            title2: '前端互助会',
            margin: EdgeInsets.only(top: 0, left: 20.w),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.h, bottom: 15.h, left: 20.w),
            child: Text(
              '只盼那瓶内脓水，不是你我日后模样',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Container(
            height: 330.h,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              itemCount: swiperList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Column(
                    children: swiperList[index].map((e) {
                      return Column(
                        children: [
                          PodcastItem(data: e),
                          SizedBox(height: 20.h),
                        ],
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
