import 'dart:math';

import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/global.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'personal_controller.dart';

class PersonalPage extends StatelessWidget {
  PersonalPage({Key? key}) : super(key: key);

  final controller = Get.put(PersonalController());
  final state = Get.find<PersonalController>().state;

  final padding = EdgeInsets.fromLTRB(20.w, 0, 20.w, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: getDeviceTopHeight() + 30.h,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            SliverPadding(
              padding: padding,
              sliver: _buildName(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 10.h),
            ),
            SliverPadding(
              padding: padding,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return _buildItem(state.list[index]);
                  },
                  childCount: state.list.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 名称
  Widget _buildName() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Global.profile!.name!,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.primaryColor,
                      size: 15.w,
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  '只盼那瓶内脓水，不是你我日后模样 ',
                  style: TextStyle(
                    color: AppColors.primaryGreyText,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<PersonalController>(
            builder: (_) => Draggable(
              // data: widget.data,
              feedback: _buildHeader(),
              child: state.isShow ? _buildHeader() : SizedBox(height: 80.w),
              onDragStarted: () {
                state.isShow = false;
                controller.update();
              },
              onDragUpdate: (details) {
                Vibration.vibrate(duration: 1, amplitude: 10);
              },
              onDragEnd: (details) {
                state.isShow = true;
                controller.update();
              },
            ),
          )
        ],
      ),
    );
  }

  /// 单个列表
  Widget _buildItem(data) {
    return GestureDetector(
      onTap: () => EasyLoading.showInfo('😊尚未开发'),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: data['name'] == 'line'
              ? Divider(
                  height: 1.h,
                  color: AppColors.primaryGreyText,
                )
              : Row(
                  children: [
                    Icon(
                      data['icon'],
                      color: AppColors.primaryColor,
                      size: 23.w,
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      data['name'],
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.primaryGreyText,
                      size: 13.w,
                    )
                  ],
                ),
        ),
      ),
    );
  }

  /// 头像
  Widget _buildHeader() {
    return ClipOval(
      child: Container(
        width: 80.w,
        height: 80.w,
        child: MyCachedNetworkImage(
          imageurl: Global.profile!.img!,
        ),
      ),
    );
  }
}
