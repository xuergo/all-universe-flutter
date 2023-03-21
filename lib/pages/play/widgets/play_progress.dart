import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';

/// progress bar
class ProgressBar extends StatefulWidget {
  ProgressBar({
    ProgressColors? colors,
    Key? key,
    required this.controller,
    required this.barHeight,
    this.handleHeight = 6,
    this.onDragStart,
    this.onDragEnd,
    this.onDragUpdate,
    this.onTapDown,
    required this.praiseList,
  })  : colors = colors ?? ProgressColors(),
        super(key: key);

  final ProgressColors colors;
  final Function()? onDragStart;
  final Function(double progress)? onDragEnd;
  final Function()? onDragUpdate;
  final Function(double progress)? onTapDown;

  final double barHeight;
  final double handleHeight;

  final ProgressBarController controller;

  ///  点赞列表 进度条突起
  final List<int> praiseList;

  //final bool drawShadow;

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  double progress = .0;

  @override
  void initState() {
    super.initState();
    progress = widget.controller.progressBarValue;
    widget.controller.addListener(_updateProgressValue);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateProgressValue);
    super.dispose();
  }

  _updateProgressValue() {
    setState(() {
      progress = widget.controller.progressBarValue;
    });
  }

  void _seekToRelativePosition(Offset globalPosition) {
    final box = context.findRenderObject()! as RenderBox;
    final Offset tapPos = box.globalToLocal(globalPosition);
    progress = tapPos.dx / box.size.width;
    if (progress < 0) progress = 0;
    if (progress > 1) progress = 1;

    setState(() {
      widget.controller.progressBarValue = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragStart: (DragStartDetails details) {
          widget.onDragStart?.call();
        },
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          widget.onDragUpdate?.call();
          _seekToRelativePosition(details.globalPosition);
        },
        onHorizontalDragEnd: (DragEndDetails details) {
          widget.onDragEnd?.call(progress);
        },
        // onTapDown: (TapDownDetails details) {
        //   widget.onTapDown?.call(progress);
        //   _seekToRelativePosition(details.globalPosition);
        // },
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: _ProgressBarPainter(
                barHeight: widget.barHeight,
                handleHeight: widget.handleHeight,
                colors: widget.colors,
                value: progress,
                praiseList: widget.praiseList,
              ),
            ),
          ),
        ));
  }
}

class _ProgressBarPainter extends CustomPainter {
  _ProgressBarPainter(
      {required this.barHeight,
      required this.handleHeight,
      required this.value,
      required this.colors,
      required this.praiseList});

  final double barHeight;
  final double handleHeight;
  final ProgressColors colors;
  final double value;
  final List<int> praiseList;

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final baseOffset = size.height / 2 - barHeight / 2;
    final double radius = 4.0;

    /// 背景
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, baseOffset),
          Offset(size.width, baseOffset + barHeight),
        ),
        const Radius.circular(4.0),
      ),
      colors.backgroundPaint,
    );

    /// 点赞数据
    List<int> A = praiseList;
    List<int> B = [];
    int minA = A.reduce(min); // 数组A中的最小值
    int maxA = A.reduce(max); // 数组A中的最大值
    int minB = 3; // 数组B中的最小值
    int maxB = 30; // 数组B中的最大值

    /// 如果数组A的长度小于40，那么在转换之前用1填充到40个元素
    if (A.length < 36) {
      A.addAll(List.filled(36 - A.length, 1));
    }

    for (int a in A) {
      if (maxA - minA == 0) {
        B.add(0);
      } else {
        int b = ((a - minA) * (maxB - minB + 1) / (maxA - minA) + minB).round();
        b = max(minB, min(maxB, b)); // 将b限制在minB和maxB之间
        B.add(b);
      }
    }

    /// 如果数组B的长度大于40，那么在转换之后截取前40个元素
    if (B.length > 36) {
      B = B.sublist(0, 36);
    }

    for (int i = 0; i < B.length; i++) {
      canvas.drawLine(
        Offset((9 * (i + 1)).w, size.height - 10.h),
        Offset((9 * (i + 1)).w, ((size.height - 10.h) - B[i].h)),
        colors.praiseLineColorPaint,
      );
    }

    /// 进度
    double playedPart =
        value > 1 ? size.width - radius : value * size.width - radius;
    if (playedPart < radius) {
      playedPart = radius;
    }

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, baseOffset),
          Offset(playedPart, baseOffset + barHeight),
        ),
        Radius.circular(radius),
      ),
      colors.playedPaint,
    );

    /// 进度线
    canvas.drawLine(
      Offset(playedPart, 0),
      Offset(playedPart, size.height),
      colors.lineColorPaint,
    );
  }
}

class ProgressBarController extends ChangeNotifier {
  double progressBarValue = .0;

  updateProgressValue(double value) {
    progressBarValue = value;
    notifyListeners();
  }
}

class ProgressColors {
  ProgressColors({
    Gradient playedColor = const LinearGradient(
      colors: [
        Color.fromRGBO(200, 200, 200, .0),
        Color.fromRGBO(255, 255, 255, .3)
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    Color bufferedColor = const Color.fromRGBO(30, 30, 200, 0.2),
    Color handleColor = const Color.fromRGBO(200, 200, 200, 1.0),
    Color backgroundColor = const Color.fromRGBO(200, 200, 200, 0.3),
    Color lineColor = const Color.fromRGBO(255, 255, 255, 1),
    Color praiseLineColor = const Color.fromRGBO(255, 255, 255, 0.3),
    Color praiseLineColor2 = const Color.fromARGB(75, 144, 10, 1),
  })  : playedPaint = Paint()
          ..shader =
              playedColor.createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 200.0)),
        bufferedPaint = Paint()..color = bufferedColor,
        handlePaint = Paint()..color = handleColor,
        backgroundPaint = Paint()..color = backgroundColor,
        lineColorPaint = Paint()
          ..color = lineColor
          ..strokeWidth = 2.w,
        praiseLineColorPaint = Paint()
          ..color = praiseLineColor
          ..strokeWidth = 5.w
          ..strokeCap = StrokeCap.round,
        praiseLineColorPaint2 = Paint()
          ..color = praiseLineColor2
          ..strokeWidth = 5.w
          ..strokeCap = StrokeCap.round;

  final Paint playedPaint;
  final Paint bufferedPaint;
  final Paint handlePaint;
  final Paint backgroundPaint;
  final Paint lineColorPaint;
  final Paint praiseLineColorPaint;
  final Paint praiseLineColorPaint2;
}
