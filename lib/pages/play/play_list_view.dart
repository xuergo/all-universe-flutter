import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/cahenetwork_image.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/pages/play/play_controller.dart';
import 'package:all_universe_flutter/utils/screen_device.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PlayListPage extends StatelessWidget {
  final controller = Get.put(PlayController());
  final playState = Get.find<PlayController>().state;
  PlayListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getDeviceWidth(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0.r),
          topRight: Radius.circular(16.0.r),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            _buildLine(),
            SizedBox(height: 30.h),
            _buildTitle(),
            SizedBox(height: 20.h),
            GetBuilder<PlayController>(builder: (_) => _buildList())
          ],
        ),
      ),
    );
  }

  Widget _buildLine() {
    return Center(
      child: Container(
        width: 50.w,
        height: 5.h,
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
          color: AppColors.primaryGreyText,
          borderRadius: BorderRadius.all(
            Radius.circular(16.0.r),
          ),
        ),
      ),
    );
  }

  /// 标题
  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '播放列表',
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          Icon(
            Icons.line_style_rounded,
            color: AppColors.primaryColor,
            size: 28.w,
          )
        ],
      ),
    );
  }

  Widget _buildList() {
    return Expanded(
      child: ReorderableListView.builder(
        physics: ClampingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _buidldListItem(
            playState.playViewList[index],
            Key('$index'),
          );
        },
        itemCount: playState.playViewList.length,
        onReorder: (int oldIndex, int newIndex) {
          controller.onReorder(oldIndex, newIndex);
        },
      ),
    );
  }

  Widget _buidldListItem(data, Key key) {
    TextStyle _textStyle = TextStyle(
      color: AppColors.primaryGreyText,
      fontSize: 13.sp,
    );
    return Container(
      height: 60.w,
      key: Key('$key'),
      margin: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 10.w),
          Icon(
            Icons.list,
            size: 20.w,
            color: AppColors.primaryGreyText,
          ),
          SizedBox(width: 10.w),
          Container(
            width: 60.w,
            height: 60.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3.r),
              child: MyCachedNetworkImage(imageurl: data.cover),
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    data.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.primaryText,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('62分钟前', style: _textStyle),
                    SizedBox(width: 5.w),
                    Text('·', style: _textStyle),
                    SizedBox(width: 5.w),
                    Text('62分钟前', style: _textStyle),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          PlayBtn(data: data),
          Icon(
            Icons.more_vert_outlined,
            color: AppColors.primaryColor,
            size: 20.w,
          ),
          SizedBox(width: 10.w),
        ],
      ),
    );
  }
}
