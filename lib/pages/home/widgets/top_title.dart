// 顶部标题
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('发现', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
