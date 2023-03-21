import 'package:all_universe_flutter/model/podcast.dart';
import 'package:flutter/material.dart';

class HomeState {
  /// 编辑精选
  List<PodcastModel> editSelectionList = [];

  /// 榜单
  List<PodcastModel> hotList = [];

  /// 推荐爱听
  List<PodcastModel> recommendList1 = [];

  /// 推荐2
  List<PodcastModel> recommendList2 = [];

  /// 寻宝
  List<PodcastModel> treasureHuntList = [];

  /// ta们喜欢
  List<PodcastModel> taLikeList = [];

  /// 榜单类型下标
  int hotSwiperIndex = 0;

  bool loading = true;

  /// 是否展示appbar文字
  bool isShowAppbarText = false;

  /// 热榜 Pageview
  PageController pageController = PageController(viewportFraction: 0.9);

  List<String> titleList = [
    '最热榜 ',
    '锋芒榜 ',
    '新星榜 ',
  ];

  ScrollController scrollController = ScrollController();
  HomeState() {}
}
