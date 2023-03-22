import 'dart:math';

import 'package:all_universe_flutter/model/podcast.dart';
import 'package:all_universe_flutter/pages/home/home_state.dart';
import 'package:get/get.dart';
import 'package:all_universe_flutter/services/services.dart';

class HomeController extends GetxController {
  final HomeState state = HomeState();

  @override
  void onInit() async {
    super.onInit();
    state.scrollController.addListener(() {
      if (state.scrollController.offset > 100) {
        state.isShowAppbarText = true;
      } else {
        state.isShowAppbarText = false;
      }
      update();
    });
    await initData();
    state.loading = false;
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  setHotSwiperIndex(int index) {
    state.hotSwiperIndex = index;
    update();
  }

  @override
  void onClose() {}

  List<PodcastModel> getRandomArrayElements(List<PodcastModel> arr, int count) {
    var shuffled = arr.sublist(0);
    var i = arr.length;
    int min = i - count;
    dynamic temp;
    dynamic index;
    while (i-- > min) {
      index =
          ((i + 1) * Random().nextDouble()).floor(); //这里的+1 是因为上面i--的操作  所以要加回来
      temp = shuffled[index]; //即值交换
      shuffled[index] = shuffled[i];
      shuffled[i] = temp;
    }
    return shuffled.sublist(min);
  }

  onRefresh() async {
    await initData();
    update();
  }

  Future<void> initData() async {
    var allList = await getRandomPodcastList({'page': 1, 'pageSize': 100});
    state.editSelectionList = getRandomArrayElements(allList, 3);
    state.hotList = getRandomArrayElements(allList, 9);
    state.recommendList1 = getRandomArrayElements(allList, 3);
    state.recommendList2 = getRandomArrayElements(allList, 9);
    state.treasureHuntList = getRandomArrayElements(allList, 3);
    state.taLikeList = getRandomArrayElements(allList, 3);
  }
}
