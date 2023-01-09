import 'package:all_universe_flutter/pages/toolbar/Index_controller.dart';
import 'package:get/get.dart';

class ToolbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToolbarController>(() => ToolbarController());
  }
}
