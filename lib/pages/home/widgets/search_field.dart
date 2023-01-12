import 'package:all_universe_flutter/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Color colorText = Color.fromRGBO(209, 209, 214, 1);

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
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: colorText,
              size: 34,
            ),
            Expanded(
              child: Text(
                '一年一度开发者大会',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: colorText,
                ),
              ),
            ),
            Icon(
              Icons.qr_code_scanner_rounded,
              color: colorText,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
