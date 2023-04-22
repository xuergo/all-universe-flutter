import 'package:all_universe_flutter/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AnimationImgBox extends StatelessWidget {
  AnimationImgBox({super.key});
  final controller = Get.put(SplashController());
  final state = Get.find<SplashController>().state;

  @override
  Widget build(BuildContext context) {
    final List imgList = [
      'lib/assets/images/cover/1L.webp',
      'lib/assets/images/cover/1N.webp',
      'lib/assets/images/cover/hY.webp',
      'lib/assets/images/cover/wf.webp',
      'lib/assets/images/cover/lL.webp',
      'lib/assets/images/cover/hG.webp',
      'lib/assets/images/cover/wc.webp',
      'lib/assets/images/cover/hL.webp',
      'lib/assets/images/cover/hY.webp',
      'lib/assets/images/cover/hZ.webp',
      'lib/assets/images/cover/lM.webp',
    ];
    final List imgList2 = [''];
    final List list = [
      {
        'topValue': 220.h,
        'left': -30.w,
        'imgWidth': 120.w,
        'url': imgList[0],
      },
      {
        'topValue': 150.h,
        'left': 150.w,
        'imgWidth': 100.w,
        'url': imgList[1],
      },
      {
        'topValue': 200.h,
        'left': 290.w,
        'imgWidth': 100.w,
        'url': imgList[2],
      },
      {
        'topValue': 270.h,
        'left': 70.w,
        'imgWidth': 80.w,
        'url': imgList[3],
      },
      {
        'topValue': 330.h,
        'left': 30.w,
        'imgWidth': 70.w,
        'url': imgList[4],
      },
      {
        'topValue': 320.h,
        'left': 230.w,
        'imgWidth': 80.w,
        'url': imgList[5],
      },
      {
        'topValue': 440.h,
        'left': -10.w,
        'imgWidth': 80.w,
        'url': imgList[6],
      },
      {
        'topValue': 480.h,
        'left': 100.w,
        'imgWidth': 100.w,
        'url': imgList[7],
      },
      {
        'topValue': 390.h,
        'left': 200.w,
        'imgWidth': 70.w,
        'url': imgList[8],
      },
      {
        'topValue': 440.h,
        'left': 330.w,
        'imgWidth': 100.w,
        'url': imgList[9],
      },
    ];
    return GetBuilder<SplashController>(
      builder: (_) => Container(
        child: LayoutBuilder(
          builder: (BuildContext, BoxConstraints constraints) {
            state.containerHeight = constraints.maxHeight;
            return Stack(
              children: list.map((item) {
                return _buildAnimatedBox(
                  topValue: item['topValue'],
                  imgWidth: item['imgWidth'],
                  left: item['left'],
                  url: item['url'],
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildAnimatedBox({
    double left = 0,
    double topValue = 0,
    double imgWidth = 100,
    int seconds = 1,
    String url = 'lib/assets/images/cover/1L.webp',
  }) {
    return AnimatedPositioned(
      bottom: state.isShow ? state.containerHeight - topValue : -150,
      left: left,
      curve: Curves.easeOut,
      child: Container(
        width: imgWidth,
        height: imgWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(3.0.r),
          child: Image(
            image: AssetImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
      duration: Duration(seconds: seconds),
    );
  }
}
