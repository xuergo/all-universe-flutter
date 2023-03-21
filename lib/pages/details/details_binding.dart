import 'package:all_universe_flutter/pages/details/details_controller.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    print("homebing");
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}
