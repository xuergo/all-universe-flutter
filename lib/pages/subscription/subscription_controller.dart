import 'package:all_universe_flutter/pages/subscription/subscription_state.dart';
import 'package:all_universe_flutter/services/services.dart';
import 'package:get/get.dart';

class SubscriptionController extends GetxController {
  final state = SubscriptionState();

  @override
  void onInit() async {
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
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  onRefresh() async {
    state.list = await getRandomPodcastList({'page': 1, 'pageSize': 10});
  }

  Future<void> initData() async {
    state.list = await getRandomPodcastList({'page': 1, 'pageSize': 10});
  }
}
