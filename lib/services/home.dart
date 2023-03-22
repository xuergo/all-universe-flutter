import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/model/podcast_detail.dart';
import 'package:all_universe_flutter/utils/utils.dart';

/// 随机播客列表
Future<List<PodcastModel>> getRandomPodcastList(
  Map? params,
) async {
  final response = await Request().get('/randomPodcastList', params: params);
  final list =
      (response.data as List).map((e) => PodcastModel.fromJson((e))).toList();
  return list;
}

/// 详情
Future<PodcastDetail> getDetails(
  Map<String, int>? params,
) async {
  final response = await Request().get('/details', params: params);
  final data = PodcastDetail.fromJson(response.data);
  return data;
}
