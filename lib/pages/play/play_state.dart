import 'package:all_universe_flutter/model/podcast_detail.dart';
import 'package:all_universe_flutter/pages/play/widgets/play_progress.dart';
import 'package:just_audio/just_audio.dart';

class PlayState {
  late AudioPlayer player;
  late ProcessingState processingState = ProcessingState.loading;

  /// 剩余时间
  String time = '00:00';

  /// 总时间
  String totalTime = '00:00';

  /// 进度条和总时间之间的转换系数
  double timeGini = 1.00;

  final ProgressBarController progressController = ProgressBarController();

  /// 播放对象
  late PodcastDetail playData;
  PlayState() {}
}
