import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/model/podcast_detail.dart';
import 'package:flutter/material.dart';

class DetailState {
  bool isShowAppbar = false;
  bool isLoading = true;
  PodcastDetail? details;
  List<PodcastModel> list = [];
  ScrollController scrollController = ScrollController();
  DetailState() {}
}
