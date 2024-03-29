import 'package:all_universe_flutter/pages/home/home_view.dart';
import 'package:all_universe_flutter/pages/personal/personal_view.dart';
import 'package:all_universe_flutter/pages/subscription/subscription_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabbarState {
  RxInt selectIndex = 0.obs;

  List<Widget> screens = [
    HomePage(),
    SubscriptionPage(),
    PersonalPage(),
  ];

  static Image generateIcon(String path) {
    return Image.asset(
      '${ImageLoader.rootPaht}/tabbar/$path',
      width: 28,
      height: 28,
    );
  }

  final List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      icon: generateIcon('toolbar1.webp'),
      activeIcon: generateIcon('toolbar1_active.webp'),
      label: '发现',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('toolbar2.webp'),
      activeIcon: generateIcon('toolbar2_active.webp'),
      label: '订阅',
    ),
    BottomNavigationBarItem(
      icon: generateIcon('toolbar3.webp'),
      activeIcon: generateIcon('toolbar3_active.webp'),
      label: '个人',
    ),
  ];
  TabbarState() {}
}

class ImageLoader {
  static const String rootPaht = 'lib/assets/images';

  static Image imageAsset(String icon) => Image.asset(rootPaht + icon);

  static Image imageNet(String url) => Image.network(url);
}
