import 'dart:developer';
import 'dart:ui';

import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/pages/home/widgets/more_btn.dart';
import 'package:all_universe_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:all_universe_flutter/pages/home/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Hot extends StatelessWidget {
  final List<PodcastModel> list;
  Hot({Key? key, required this.list}) : super(key: key);
  final controller = Get.find<HomeController>();
  final state = Get.find<HomeController>().state;

  @override
  Widget build(BuildContext context) {
    List<List<PodcastModel>> swiperList = getSplitList(list, 3);
    return GetBuilder<HomeController>(
      builder: (_) => Container(
        margin: EdgeInsets.only(top: 40.h),
        child: Column(
          children: [
            /// 标题
            _titeleBar(),

            /// 内容
            _contenterBox(swiperList),

            /// 分页
            _linePage(),

            SizedBox(height: 20.h),

            /// 更多
            MoreBtn(text: '查看完整榜单')
          ],
        ),
      ),
    );
  }

  /// 标题
  late final List<GestureDetector> _titleBarList =
      state.titleList.asMap().entries.map((entry) {
    final String text = entry.value;
    final int index = entry.key;
    return GestureDetector(
      onTap: () {
        state.pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
        controller.setHotSwiperIndex(index);
      },
      child: state.hotSwiperIndex == index
          ? _titleItem(text)
          : _titleItemFileter(text),
    );
  }).toList();

  Widget _titeleBar() {
    return Container(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: _titleBarList,
          ),
          Icon(
            Icons.arrow_forward,
            color: AppColors.primaryColor,
            size: 25.w,
          ),
        ],
      ),
    );
  }

  /// 单个标题-模糊
  Widget _titleItemFileter(String text) {
    return Stack(
      children: [
        Text(
          '$text',
          style: TextStyle(
            fontSize: 20.sp,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
        Container(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                width: 66.w,
                height: 25.h,
                color: Colors.white70,
              ),
            ),
          ),
        )
      ],
    );
  }

  /// 单个标题
  Widget _titleItem(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }

  /// 内容
  Widget _contenterBox(List<List<PodcastModel>> swiperlist) {
    return Container(
      height: 180.h,
      child: PageView.builder(
        controller: state.pageController,
        itemCount: swiperlist.length,
        padEnds: false,
        onPageChanged: (value) {
          controller.setHotSwiperIndex(value);
        },
        itemBuilder: (BuildContext context, int itemIndex) {
          final items = swiperlist[itemIndex];
          return ListView.builder(
            itemCount: items.length,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              final data = items[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h),
                child: _contenterBoxItem(data, index + 1),
              );
            },
          );
        },
      ),
    );
  }

  Widget _contenterBoxItem(PodcastModel data, int index) {
    return GestureDetector(
      onTap: () => Get.toNamed('/details'),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            SizedBox(width: 20.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Container(
                width: 40.h,
                height: 40.h,
                child: MyCachedNetworkImage(
                  imageurl: data.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 30.w,
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: TextStyle(
                  color: AppColors.primaryGreyText,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.desc,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    data.name,
                    style: TextStyle(
                      color: AppColors.primaryGreyText,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            PlayBtn(data: data),
            SizedBox(width: 20.w),
          ],
        ),
      ),
    );
  }

  Widget _linePage() {
    final List<Widget> items = state.titleList.asMap().entries.map((entry) {
      final int index = entry.key;
      return Container(
        width: 105.w,
        height: 3.h,
        decoration: BoxDecoration(
          color: state.hotSwiperIndex == index
              ? AppColors.primaryColor
              : AppColors.primaryGreyBackground,
        ),
      );
    }).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }
}
