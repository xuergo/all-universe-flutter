import 'package:all_universe_flutter/pages/play/bottom_play_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_appbar.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // X方向的偏移量
  double offsetY; // Y方向的偏移量
  CustomFloatingActionButtonLocation(this.location, this.offsetX, this.offsetY);

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}

class BaseScaffold extends Scaffold {
  BaseScaffold(
      {String? title,
      PreferredSizeWidget? appBar,
      required Widget body,
      List<Widget>? actions,
      AppBarBackType? leadType,
      WillPopCallback? onWillPop,
      Brightness brightness = Brightness.light,
      Widget? floatingActionButton,
      Color appBarBackgroundColor = Colors.white,
      Color? titleColor,
      bool centerTitle = true,
      BottomNavigationBar? bottomNavigationBar,
      FloatingActionButtonLocation? floatingActionButtonLocation})
      : super(
          appBar: appBar,
          backgroundColor: Colors.white,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: BottomPlayBarPage(),
          floatingActionButtonLocation: CustomFloatingActionButtonLocation(
              FloatingActionButtonLocation.centerDocked, 0, -(60 / 2).h),
        );
}
