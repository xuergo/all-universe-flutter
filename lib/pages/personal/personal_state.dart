import 'package:flutter/material.dart';

class PersonalState {
  List list = [
    {
      'name': '个人主页',
      'icon': Icons.supervised_user_circle_outlined,
    },
    {
      'name': '创造中心',
      'icon': Icons.local_fire_department_outlined,
    },
    {'name': 'line'},
    {
      'name': '我的通知',
      'icon': Icons.notifications_none_outlined,
    },
    {
      'name': '收听历史',
      'icon': Icons.access_time,
    },
    {
      'name': '我的收藏',
      'icon': Icons.star_border_rounded,
    },
    {
      'name': '付费账户',
      'icon': Icons.sentiment_very_satisfied_sharp,
    },
    {'name': 'line'},
    {
      'name': '问题反馈',
      'icon': Icons.messenger_outline_rounded,
    },
    {
      'name': '设置',
      'icon': Icons.settings,
    },
  ];

  /// 显示子拖动前的头像
  bool isShow = true;
  PersonalState();
}
