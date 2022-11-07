import 'package:all_univers/pages/test_page/index.dart';
import 'package:flutter/material.dart';
import 'package:all_univers/pages/home/index.dart';

class Toolbar extends StatefulWidget {
  const Toolbar({super.key});

  @override
  State<Toolbar> createState() => _ToolbarState();
}

class _ToolbarState extends State<Toolbar> {
  int cuttentIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/app_bg.webp'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomePage(),
              TestPage(
                title: '11',
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(87, 177, 220, 1),
        unselectedItemColor: const Color.fromRGBO(199, 199, 203, 1),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: cuttentIndex,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
            cuttentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'lib/assets/images/toolbar/toolbar1.webp',
              width: 28,
              height: 28,
            ),
            activeIcon: Image.asset(
              'lib/assets/images/toolbar/toolbar1_active.webp',
              width: 28,
              height: 28,
            ),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'lib/assets/images/toolbar/toolbar2.webp',
              width: 28,
              height: 28,
            ),
            activeIcon: Image.asset(
              'lib/assets/images/toolbar/toolbar2_active.webp',
              width: 28,
              height: 28,
            ),
            label: '订阅',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'lib/assets/images/toolbar/toolbar3.webp',
              width: 28,
              height: 28,
            ),
            activeIcon: Image.asset(
              'lib/assets/images/toolbar/toolbar3_active.webp',
              width: 28,
              height: 28,
            ),
            label: '个人',
          ),
        ],
      ),
    );
  }
}
