import 'dart:developer';

import 'package:all_universe_flutter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchField extends GetView<HomeController> {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 242, 247, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: TextField(
            onChanged: (value) => log(value),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: '一年一度脱口秀大会',
                hintStyle: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(188, 188, 193, 1),
                ),
                labelStyle: TextStyle(
                  fontSize: 17,
                  color: Color.fromRGBO(255, 255, 255, 1),
                )),
          ),
        ));
  }
}
