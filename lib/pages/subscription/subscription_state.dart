import 'package:all_universe_flutter/model/podcast.dart';
import 'package:flutter/material.dart';

class SubscriptionState {
  bool loading = true;
  bool isShowAppbarText = false;

  ScrollController scrollController = ScrollController();
  List<PodcastModel> list = [];
  SubscriptionState();
}
