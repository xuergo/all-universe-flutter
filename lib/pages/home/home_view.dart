import 'package:flutter/material.dart';
import 'package:all_universe_flutter/components/components.dart';
import 'package:all_universe_flutter/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('首页'),
        leadingType: AppBarBackType.None,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Center(child: Text(controller.count.toString()))),
            TextButton(
                onPressed: () => controller.increment(),
                child: Text('count111+')),
            GetBuilder<HomeController>(builder: (_) {
              return Text(controller.userName);
            }),
            TextButton(
                onPressed: () => controller.changeUserName(),
                child: Text('changeName')),
          ],
        ),
      ),
    );
  }
}
