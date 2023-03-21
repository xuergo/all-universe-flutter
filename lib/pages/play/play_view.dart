import 'dart:developer';

import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/components/custom_like.dart';
import 'package:all_universe_flutter/components/custom_share.dart';
import 'package:all_universe_flutter/pages/play/widgets/play_progress.dart';
import 'package:all_universe_flutter/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'play_controller.dart';

class PlayPage extends StatelessWidget {
  PlayPage({Key? key}) : super(key: key);

  final controller = Get.find<PlayController>();
  final state = Get.find<PlayController>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlayController>(
      builder: (_) => Scaffold(
        body: InkWell(
            child: Container(
          width: getDeviceWidth(context),
          height: getDeviceHeight(context),
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              /// 标题
              _buildAppbar(),

              SizedBox(height: 30.h),

              /// 封面
              _buildCover(),

              SizedBox(height: 30.h),

              /// 名称
              _buildTitle(),

              SizedBox(height: 10.h),
              _buildName(),

              /// 进度条
              _buildProgress(),

              SizedBox(height: 10.h),

              /// 播放按钮
              _buildPlay(),
              Spacer(),

              /// 底部按钮
              _buildBottom(),
              Icon(
                Icons.keyboard_arrow_up_sharp,
                color: AppColors.primaryGreyText,
                size: 30.w,
              ),
              SizedBox(height: getDeviceBottomHeight())
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  //渐变位置
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                0.0,
                0.9
              ], //[渐变起始点, 渐变结束点]
                  //渐变颜色[始点颜色, 结束颜色]
                  colors: [
                Color.fromRGBO(21, 23, 18, 1),
                Color.fromRGBO(22, 32, 12, 1)
              ])),
        )),
      ),
    );
  }

  /// appbar
  Widget _buildAppbar() {
    return Container(
      padding: EdgeInsets.only(top: getDeviceTopHeight()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard_arrow_down_outlined,
            color: Colors.white,
            size: 20.w,
          ),
          SizedBox(width: 10.w),

          /// 人数
          Container(
            padding:
                EdgeInsets.only(left: 10.w, right: 10.w, top: 6.h, bottom: 6.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
            child: Row(
              children: [
                Container(
                  width: 6.w,
                  height: 6.w,
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreenText,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: 10,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.w),
                Text(
                  '400+ 人正在听',
                  style: TextStyle(
                    color: AppColors.primaryGreyText,
                    fontSize: 8.sp,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),

          /// 收藏
          CustomLikeBtn(color: Colors.white),
          SizedBox(width: 20.w),

          /// 分享
          CustomShareBtn(color: Colors.white),
        ],
      ),
    );
  }

  /// 封面
  Widget _buildCover() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        child: Container(
          width: 280.w,
          height: 280.w,
          child: MyCachedNetworkImage(
            imageurl: state.playData.cover,
          ),
          decoration: BoxDecoration(
            color: Colors.amber,
          ),
        ),
      ),
    );
  }

  /// 标题
  Widget _buildTitle() {
    return Center(
      child: Container(
        child: Text(
          state.playData.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// 名称
  Widget _buildName() {
    return Center(
      child: Container(
        child: Text(
          state.playData.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.primaryGreenText,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }

  /// 进度条
  Widget _buildProgress() {
    TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    );
    return Column(
      children: [
        /// 时间
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '00:00',
              style: textStyle,
            ),
            Text(
              '- ${state.time}',
              style: textStyle,
            ),
          ],
        ),

        SizedBox(height: 10.h),

        /// 进度条
        Container(
          height: 55.h,
          child: ProgressBar(
            controller: state.progressController,
            barHeight: 55.h,
            onDragStart: () {
              state.player.pause();
            },
            onDragEnd: (double progress) {
              controller.seekPlay(progress);
            },
            praiseList: [10, 20, 30, 1, 3, 80, 2],
          ),
        )
      ],
    );
  }

  /// 播放按钮
  Widget _buildPlay() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.settings,
            color: AppColors.primaryGreyText,
            size: 30.w,
          ),
          GestureDetector(
            onTap: () => controller.back(),
            child: Icon(
              Icons.settings_backup_restore,
              color: Colors.white,
              size: 40.w,
            ),
          ),
          _playerButton(),
          GestureDetector(
            onTap: () => controller.fast(),
            child: Transform.scale(
              scaleX: -1,
              child: Icon(
                Icons.settings_backup_restore,
                color: Colors.white,
                size: 40.w,
              ),
            ),
          ),
          Icon(
            Icons.thumb_up_alt_outlined,
            color: AppColors.primaryGreyText,
            size: 30.w,
          ),
        ],
      ),
    );
  }

  // 播放按钮样式
  Widget _playerButton() {
    final processingState = state.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      // 2
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 80.w,
        height: 80.w,
        child: CupertinoActivityIndicator(color: Colors.white, radius: 22),
      );
    } else if (state.player.playing != true) {
      // 3
      return IconButton(
        icon: Icon(Icons.play_arrow_rounded),
        iconSize: 80.w,
        color: Colors.white,
        onPressed: state.player.play,
      );
    } else if (processingState != ProcessingState.completed) {
      // 4
      return IconButton(
        icon: Icon(Icons.pause_rounded),
        iconSize: 80.w,
        color: Colors.white,
        onPressed: state.player.pause,
      );
    } else {
      // 5
      return IconButton(
        icon: Icon(Icons.replay),
        iconSize: 80.w,
        color: Colors.white,
        onPressed: () => state.player
            .seek(Duration.zero, index: state.player.effectiveIndices!.first),
      );
    }
  }

  /// 底部按钮
  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.info_outline,
            color: AppColors.primaryGreyText,
            size: 30.w,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.list_rounded,
                  size: 15.w,
                  color: AppColors.primaryGreyText,
                ),
                SizedBox(width: 5.w),
                Text(
                  '待播列表',
                  style: TextStyle(
                    color: AppColors.primaryGreyText,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 10.h),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.2),
              borderRadius: BorderRadius.all(Radius.circular(6.r)),
            ),
            child: Icon(
              Icons.message_outlined,
              color: AppColors.primaryGreyText,
              size: 20.w,
            ),
          ),
        ],
      ),
    );
  }
}
