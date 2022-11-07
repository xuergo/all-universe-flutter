import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:all_univers/get_pages.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: pages,
  ));
}
