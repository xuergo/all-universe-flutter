import 'package:all_universe_flutter/pages/play/widgets/play_progress.dart';
import 'package:just_audio/just_audio.dart';

class PlayState {
  /// 播放器
  AudioPlayer player = AudioPlayer();
  ProcessingState processingState = ProcessingState.idle;

  /// 剩余时间
  String time = '00:00';

  /// 总时间
  String totalTime = '00:00';

  /// 进度条和总时间之间的转换系数
  double timeGini = 1.00;

  final ProgressBarController progressController = ProgressBarController();

  /// 播放对象
  dynamic playData;

  /// 播放列表显示用
  List<dynamic> playViewList = [];

  /// 播放列表 -  播放器用
  ConcatenatingAudioSource playList = ConcatenatingAudioSource(
    // 播放下个音频之前加载
    useLazyPreparation: true,
    // 定义切换算法
    shuffleOrder: DefaultShuffleOrder(),
    // 指定播放列表项目
    children: [],
  );

  PlayState() {}
}
