import 'package:flutter/material.dart';
import 'package:all_universe_flutter/common/colors/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// appbar 返回按钮类型
enum AppBarBackType { Back, Close, None }

const double kNavigationBarHeight = 44.0;

// 自定义 AppBar
class MyAppBar extends AppBar implements PreferredSizeWidget {
  MyAppBar({
    Key? key,
    Widget? title,
    AppBarBackType? leadingType,
    WillPopCallback? onWillPop,
    Widget? leading,
    Brightness? brightness,
    Color? backgroundColor,
    List<Widget>? actions,
    bool centerTitle = true,
    double? elevation,
    Color? backArrowColor = AppColors.primaryColor,
  }) : super(
          key: key,
          title: title,
          centerTitle: centerTitle,
          backgroundColor: backgroundColor ?? AppColors.primaryBackground,
          leading: leading ??
              (leadingType == AppBarBackType.None
                  ? Container()
                  : AppBarBack(
                      leadingType ?? AppBarBackType.Back,
                      onWillPop: onWillPop,
                      color: backArrowColor,
                    )),
          actions: actions,
          elevation: elevation ?? 0.5,
        );
  @override
  get preferredSize => Size.fromHeight(44);
}

// 自定义返回按钮
class AppBarBack extends StatelessWidget {
  final AppBarBackType _backType;
  final Color? color;
  final WillPopCallback? onWillPop;

  AppBarBack(this._backType, {this.onWillPop, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final willBack = onWillPop == null ? true : await onWillPop!();
        if (!willBack) return;
        Navigator.pop(context);
      },
      child: _backType == AppBarBackType.Close
          ? Container(
              child: Icon(Icons.close, color: color, size: 24.0.r),
            )
          : Container(
              padding: EdgeInsets.only(right: 0.r),
              child: Icon(Icons.arrow_back, size: 24.0.r, color: color),
            ),
    );
  }
}

class MyTitle extends StatelessWidget {
  final String _title;
  final Color? color;

  MyTitle(this._title, {this.color});

  @override
  Widget build(BuildContext context) {
    return Text(_title,
        style: TextStyle(
            color: color ?? Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w500));
  }
}
