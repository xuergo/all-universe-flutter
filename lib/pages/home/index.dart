import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:all_univers/components/refresh/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _count = 10;
  double _pixels = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        // color: Colors.blueAccent,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            _pixels = notification.metrics.pixels;
            setState(() {});
            return true;
          },
          child: EasyRefresh(
            header: const SquatsHeader(),
            footer: const SquatsFooter(),
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 4));
              if (!mounted) {
                return;
              }
              setState(() {
                _count = 10;
              });
            },
            onLoad: () async {
              await Future.delayed(const Duration(seconds: 4));
              if (!mounted) {
                return;
              }
              setState(() {
                _count += 5;
              });
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    alignment: Alignment.center,
                    height: 80,
                    child: Text('${index + 1}'),
                  ),
                );
              },
              itemCount: _count,
            ),
          ),
        ),
      ),
      Visibility(
        visible: true,
        child: Positioned(
          left: 0,
          top: 0,
          width: MediaQuery.of(context).size.width,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: _pixels > 30 ? 1 : 0,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 253, 251, 251),
                  offset: Offset(0.0, 1.0), //阴影xy轴偏移量
                  blurRadius: 1, //阴影模糊程度
                  spreadRadius: 1.0, //阴影扩散程度
                )
              ]),
              child: const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text("发现"),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
