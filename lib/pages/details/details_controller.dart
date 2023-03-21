import 'dart:developer';

import 'package:all_universe_flutter/pages/details/details_state.dart';
import 'package:all_universe_flutter/services/services.dart';
import 'package:get/get.dart';

class DetailsController extends GetxController {
  final DetailState state = DetailState();

  @override
  void onInit() async {
    ///监听滚动位置
    state.scrollController.addListener(() {
      if (state.scrollController.offset > 60) {
        state.isShowAppbar = true;
      } else {
        state.isShowAppbar = false;
      }
      update();
    });
    state.details = await getDetails();
    state.list = await getRandomPodcastList({'pageSize': '5'});
    state.isLoading = false;
    update();
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
