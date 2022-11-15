import 'package:flutter/material.dart';

// 通用背景
class HeaderBg extends StatelessWidget {
  const HeaderBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/app_bg.webp'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
