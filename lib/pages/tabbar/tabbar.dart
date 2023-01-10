import 'package:all_universe_flutter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:all_universe_flutter/common/size_config.dart';
import 'package:all_universe_flutter/pages/home/home_view.dart';
import 'package:all_universe_flutter/pages/test/test_screen.dart';
import 'package:get/get.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class ImageLoader {
  static const String rootPaht = 'lib/assets/images';

  static Image imageAsset(String icon) => Image.asset(rootPaht + icon);

  static Image imageNet(String url) => Image.network(url);
}

class _TabbarPageState extends State<TabbarPage> {
  int _select = 0;

  final screens = [
    HomePage(),
    const TestScreen(title: '订阅'),
    const TestScreen(title: '个人'),
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

  @override
  void initState() {
    Get.lazyPut<HomeController>(() => HomeController());
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: screens[_select],
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        onTap: ((value) => setState(() => _select = value)),
        currentIndex: _select,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
        ),
        showUnselectedLabels: true,
        selectedItemColor: const Color.fromRGBO(87, 177, 220, 1),
        unselectedItemColor: const Color.fromRGBO(199, 199, 203, 1),
        selectedFontSize: 10,
        unselectedFontSize: 10,
      ),
    );
  }
}
