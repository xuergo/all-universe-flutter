// 编辑精选
import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/play_btn.dart';
import 'package:all_universe_flutter/model/podcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef EditSelectionItemOnTaped = void Function(PodcastModel data);

class EditSelectionItem extends StatelessWidget {
  const EditSelectionItem({Key? key, required this.data, this.ontap})
      : super(key: key);

  final PodcastModel data;
  final EditSelectionItemOnTaped? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap?.call(data),
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6.r),
              child: Image.network(
                data.cover,
                width: 70.w,
                height: 70.w,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                children: [
                  _nameAndPlayer(),
                  SizedBox(height: 10.h),
                  _desc(),
                  SizedBox(height: 10.h),
                  _bottomData(),
                  SizedBox(height: 30.h)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 标题播放按钮
  Widget _nameAndPlayer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${data.name}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primaryGreyText,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                '${data.name}',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
        PlayBtn(
          data: data,
        ),
      ],
    );
  }

  //描述
  Widget _desc() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryGreyBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(10).w,
        child: RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          text: TextSpan(
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.primaryText,
            ),
            children: [
              TextSpan(
                text: '${data.name}:',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(text: '${data.desc}'),
            ],
          ),
        ),
      ),
    );
  }

  // 收听数据
  Widget _bottomData() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _userHeader(),
            SizedBox(width: 2.w),
            Text(
              '听过',
              style: TextStyle(
                color: AppColors.primaryGreyText,
                fontSize: 11.sp,
              ),
            )
          ],
        ),
        Row(
          children: [
            _bottomDataIcon(Icons.headphones_rounded),
            SizedBox(width: 5.w),
            _bottomDataText(text: '9008'),
            SizedBox(width: 5.w),
            _bottomDataText(text: '·'),
            SizedBox(width: 5.w),
            _bottomDataIcon(Icons.insert_comment_sharp),
            SizedBox(width: 5.w),
            _bottomDataText(text: '411'),
          ],
        ),
      ],
    );
  }

  //收听数据-头像
  Widget _userHeader() {
    return Container(
      width: 45.w,
      height: 17.w,
      child: Stack(
        children: List.generate(
          data.userList.length,
          (index) => Positioned(
            right: (index * 13.0).w,
            child: _userHeaderItem(data.userList[index].img),
          ),
        ).reversed.toList(),
      ),
    );
  }

  /// 用户头像
  Widget _userHeaderItem(url) {
    return Container(
      width: 17.w,
      height: 17.w,
      padding: EdgeInsets.all(2).w,
      child: ClipOval(
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: .1.w, color: AppColors.primaryGreyText),
        color: Colors.white,
      ),
    );
  }

//收听数据-icon
  Widget _bottomDataIcon(IconData icon) {
    return Icon(
      icon,
      size: 11.sp,
      color: AppColors.primaryGreyText,
    );
  }

//收听数据-text
  Widget _bottomDataText({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 11.sp,
        color: AppColors.primaryGreyText,
      ),
    );
  }
}
