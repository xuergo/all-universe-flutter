import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_universe_flutter/pages/toolbar/Index_controller.dart';

class ToolbarPage extends GetView<ToolbarController> {
  const ToolbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Text('测试'),
        ));
  }
}
