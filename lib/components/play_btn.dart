/// 播放按钮

import 'dart:math';

import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/pages/play/play_controller.dart';
import 'package:all_universe_flutter/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayBtn extends StatelessWidget {
  final double? size;
  final String type;
  final data;
  final bool isShowDataColor;
  PlayBtn({
    super.key,
    required this.data,
    this.size,
    this.isShowDataColor = false,
    this.type = 'toPage',
  });

  final controller = Get.find<PlayController>();
  final state = Get.find<PlayController>().state;
  final PlayState = Get.find<PlayController>().state;
  late final Color color;

  @override
  Widget build(BuildContext context) {
    if (data.color != null && isShowDataColor) {
      color = hexToColor(data.color);
    } else {
      color = AppColors.primaryColor;
    }

    return GetBuilder<PlayController>(
      builder: (_) => GestureDetector(
        onTap: () {
          if (type == 'toPage') {
            toPlayPage();
          }
        },
        child: PlayState.processingState == ProcessingState.idle
            ? _playBtn()
            : _playerButtons(),
      ),
    );
  }

  // 播放按钮样式
  Widget _playerButtons() {
    final processingState = state.processingState;

    if (data.id != state.playData?.id) {
      return _playBtn();
    } else if (processingState == ProcessingState.idle ||
        processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return _loadingBtn();
    } else if (state.player.playing != true) {
      return _playBtn();
    } else if (processingState != ProcessingState.completed) {
      return _pauseBtn();
    } else {
      return _playBtn();
    }
  }

  Widget _playBtn() {
    return _playPauseBtn(
      icon: Icons.play_arrow_rounded,
      onTap: () => controller.play(data),
    );
  }

  Widget _pauseBtn() {
    return _playPauseBtn(
      icon: Icons.pause_rounded,
      onTap: () => state.player.pause(),
    );
  }

  Widget _pauseBtn1() {
    return GestureDetector(
      onTap: () => state.player.pause(),
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: data.id == state.playData?.id
              ? Colors.white
              : color.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
          border: Border.all(
            color: data.id == state.playData?.id
                ? AppColors.primaryGreyBackground
                : color.withOpacity(0), // 设置边框颜色为红色
            width: 4.0.w, // 设置边框宽度为 2 像素
            style: BorderStyle.solid, // 使用实线样式
          ),
        ),
        child: Icon(
          Icons.pause_rounded,
          size: size != null ? size : 28.w,
          color: data.id == state.playData?.id ? Colors.black : color,
        ),
      ),
    );
  }

  Widget _playPauseBtn({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: CustomPaint(
          painter: CircleProgressBarPainter(
            strokeWidth: 3.w,
            value: data.id == state.playData?.id ? state.progressValue : 0,
            backgroundColor: data.id == state.playData?.id
                ? AppColors.primaryGreyBackground
                : Colors.transparent,
            color: AppColors.primaryColor,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: data.id == state.playData?.id
                  ? Colors.transparent
                  : color.withOpacity(0.1),
              borderRadius: BorderRadius.all(Radius.circular(100.r)),
            ),
            child: Padding(
              padding: EdgeInsets.all(6.w),
              child: Icon(
                icon,
                size: size != null ? size : 28.w,
                color: data.id == state.playData?.id ? Colors.black : color,
              ),
            ),
          ),
        ));
  }

  Widget _loadingBtn() {
    return Container(
      margin: EdgeInsets.all(8.0.w),
      width: size != null ? size : 28.w,
      height: size != null ? size : 28.w,
      child: CircularProgressIndicator(),
    );
  }
}

class CircleProgressBarPainter extends CustomPainter {
  final double strokeWidth;
  final double value;
  final Color backgroundColor;
  final Color color;

  CircleProgressBarPainter({
    required this.strokeWidth,
    required this.value,
    required this.backgroundColor,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final sweepAngle = 360.0 * value;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle * pi / 180.0,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CircleProgressBarPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
