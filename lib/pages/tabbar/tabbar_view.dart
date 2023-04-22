import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/custom_scaffold.dart';
import 'package:all_universe_flutter/pages/play/bottom_play_bar_view.dart';
import 'package:all_universe_flutter/pages/play/play_controller.dart';
import 'package:all_universe_flutter/pages/tabbar/tabbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // X方向的偏移量
  double offsetY; // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}

class TabbarPage extends StatelessWidget {
  TabbarPage({super.key});
  final controller = Get.put(TabbarController());
  final playController = Get.put(PlayController());
  final state = Get.find<TabbarController>().state;
  final PlayState = Get.find<PlayController>().state;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.centerDocked, 0, -(60 / 2).h),
      floatingActionButton: GetBuilder<PlayController>(
        builder: (_) {
          return PlayState.playData == null ? SizedBox() : BottomPlayBarPage();
        },
      ),
      body: Obx(
        () => IndexedStack(
          index: state.selectIndex.value,
          children: state.screens,
        ),
      ),
      // body: Obx(() => state.screens[state.selectIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: state.items,
          onTap: ((value) => controller.changeTabbar(value)),
          currentIndex: state.selectIndex.value,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
          ),
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.primaryGreyText,
          selectedFontSize: 10.sp,
          unselectedFontSize: 10.sp,
        ),
      ),
    );
  }
}
