/// 播放按钮

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
        child: _playerButton(),
      ),
    );
  }

  // 播放按钮样式
  Widget _playerButton() {
    final processingState = state.processingState;

    if (data.id != state.playData.id) {
      return _playBtn();
    } else if (processingState == ProcessingState.loading ||
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
    return GestureDetector(
      onTap: () => state.player.play(),
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        child: Icon(
          Icons.play_arrow_rounded,
          size: size != null ? size : 28.w,
          color: color,
        ),
      ),
    );
  }

  Widget _pauseBtn() {
    return GestureDetector(
      onTap: () => state.player.pause(),
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(100.r)),
        ),
        child: Icon(
          Icons.pause_rounded,
          size: size != null ? size : 28.w,
          color: color,
        ),
      ),
    );
  }

  Widget _loadingBtn() {
    return Container(
      margin: EdgeInsets.all(8.0),
      width: size != null ? size : 28.w,
      height: size != null ? size : 28.w,
      child: CircularProgressIndicator(),
    );
  }
}
