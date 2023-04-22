import 'package:all_universe_flutter/pages/play/play_state.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class PlayController extends GetxController {
  late PlayState state;
  @override
  void onInit() {
    state = PlayState();
    // await Future.delayed(Duration(seconds: 10));

    /// 监听播放器播放进度
    state.player.positionStream.listen(
      (position) {
        final duration = state.player.duration;
        if (duration == null) return;

        /// 时间转换系数
        getTimeGini();
        final remainingSeconds = (duration - position).inSeconds;
        final remainingDuration = Duration(seconds: remainingSeconds);
        state.time =
            '${remainingDuration.inHours.toString().padLeft(2, '0')}:${remainingDuration.inMinutes.toString().padLeft(2, '0')}:${(remainingDuration.inSeconds % 60).toString().padLeft(2, '0')}';

        /// 进度条位置
        state.progressValue = position.inSeconds * state.timeGini;
        state.progressController.updateProgressValue(state.progressValue);

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

  /// 播放
  void play(data) async {
    state.progressValue = 0;

    /// 继续播放
    if (state.playData != null && data.id == state.playData?.id) {
      state.player.play();
      return;
    }

    state.playData = data;
    update();

    /// 播放列表
    int index =
        state.playViewList.indexWhere((item) => item.id == state.playData.id);
    if (index != -1) {
      state.playViewList.removeAt(index);
    }
    state.playViewList.insert(0, state.playData);

    List<AudioSource> audioSources = state.playViewList
        .map((item) => AudioSource.uri(
              Uri.parse(item.url),
              tag: MediaItem(
                id: '${item.id}',
                album: item.title,
                title: item.title,
                artUri: Uri.parse(item.cover),
              ),
            ))
        .toList();

    state.playList = ConcatenatingAudioSource(
      // 播放下个音频之前加载
      useLazyPreparation: true,
      // 定义切换算法
      shuffleOrder: DefaultShuffleOrder(),
      children: audioSources,
    );

    await state.player.setAudioSource(state.playList,
        initialIndex: 0, initialPosition: Duration.zero);

    await state.player.play();

    update();
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

  /// 获取时间转换系数
  getTimeGini() {
    final duration = state.player.duration;
    final totalSeconds = duration!.inSeconds;
    state.timeGini = 1 / totalSeconds;
  }

  /// 拖拽事件
  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    /// 视图列表
    final item = state.playViewList.removeAt(oldIndex);
    state.playViewList.insert(newIndex, item);

    /// 播放列表
    state.playList.children.removeAt(oldIndex);
    state.playList.children.insert(0, AudioSource.uri(Uri.parse(item.url)));
  }
}
