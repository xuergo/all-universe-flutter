import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:all_universe_flutter/components/custom_scaffold.dart';
import 'package:all_universe_flutter/pages/tabbar/tabbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabbarPage extends StatelessWidget {
  final controller = Get.put(TabbarController());
  final state = Get.find<TabbarController>().state;

  TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabbarController>(
      builder: (_) => BaseScaffold(
        body: state.screens[state.selectIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: state.items,
          onTap: ((value) => controller.changeTabbar(value)),
          currentIndex: state.selectIndex,
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
