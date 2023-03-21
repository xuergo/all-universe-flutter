import 'dart:developer';

import 'package:all_universe_flutter/pages/play/play_state.dart';
import 'package:all_universe_flutter/services/home.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PlayController extends GetxController {
  final PlayState state = PlayState();

  @override
  void onInit() async {
    state.playData = await getDetails();

    state.player = AudioPlayer();
    await state.player.setUrl(state.playData.url);

    /// 时间转换系数
    getTimeGini();

    /// 监听播放器播放进度
    state.player.positionStream.listen(
      (position) {
        final duration = state.player.duration;
        final remainingSeconds = (duration! - position).inSeconds;
        final remainingDuration = Duration(seconds: remainingSeconds);
        state.time =
            '${remainingDuration.inHours.toString().padLeft(2, '0')}:${remainingDuration.inMinutes.toString().padLeft(2, '0')}:${(remainingDuration.inSeconds % 60).toString().padLeft(2, '0')}';

        /// 进度条位置
        double progressValue = position.inSeconds * state.timeGini;
        state.progressController.updateProgressValue(progressValue);

        /// 总时长
        final totalDuration = Duration(seconds: duration.inSeconds);
        state.totalTime =
            '${remainingDuration.inHours.toString().padLeft(2, '0')}:${totalDuration.inMinutes.toString().padLeft(2, '0')}:${(totalDuration.inSeconds % 60).toString().padLeft(2, '0')}';
        update();
      },
    );

    /// 播放器状态
    state.player.playerStateStream.listen(
      (playerState) {
        state.processingState = playerState.processingState;
        update();
      },
    );

    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    state.player.pause();
    state.player.dispose();
  }

  /// 初始化数据
  getData() async {
    state.playData = await getDetails();
    update();
  }

  /// 获取时间转换系数
  getTimeGini() {
    final duration = state.player.duration;
    final totalSeconds = duration!.inSeconds;
    state.timeGini = 1 / totalSeconds;
  }

  /// 拖动进度条
  void seekPlay(double progress) {
    double _sliderValue = progress / state.timeGini;
    state.player.seek(Duration(seconds: _sliderValue.toInt()));
    state.player.play();
  }

  /// 快进
  void fast() async {
    await state.player.seek(state.player.position + Duration(seconds: 30));
  }

  /// 后退
  void back() async {
    await state.player.seek(state.player.position + Duration(seconds: -15));
  }
}
