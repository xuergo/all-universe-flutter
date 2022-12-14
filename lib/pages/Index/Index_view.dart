import 'package:all_universe_flutter/pages/tabbar/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:all_universe_flutter/global.dart';
import 'package:all_universe_flutter/pages/Index/Index_controller.dart';
import 'package:all_universe_flutter/pages/login/login_view.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Global.isOfflineLogin ? TabbarPage() : LoginPage(),
    );
  }
}
