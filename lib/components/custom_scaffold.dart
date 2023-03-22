import 'package:flutter/material.dart';
import 'custom_appbar.dart';

class BaseScaffold extends Scaffold {
  BaseScaffold({
    String? title,
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
    Widget? bottomNavigationBar,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) : super(
          appBar: appBar,
          backgroundColor: Colors.white,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        );
}
