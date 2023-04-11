import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Browser extends StatefulWidget {
  const Browser(
      {Key? key, required this.url, required this.title, this.onPageFinished});

  final String url;
  final String title;
  final Function(String url)? onPageFinished;

  @override
  State<Browser> createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  GlobalKey progressBarKey = GlobalKey();
  double progressBarValue = 0;
  final WebViewController webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  @override
  void initState() {
    webViewController.loadRequest(Uri.parse(widget.url));
    webViewController.setNavigationDelegate(NavigationDelegate(
        onNavigationRequest: (request) {
          return NavigationDecision.navigate;
        },
        onProgress: (progress) {
          if (progressBarKey.currentState?.mounted ?? false) {
            progressBarKey.currentState?.setState(() {
              progressBarValue = progress / 100.toDouble();
            });
          }
        },
        onPageFinished: widget.onPageFinished));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(children: [
        StatefulBuilder(
            key: progressBarKey,
            builder: (context, setState) {
              return Visibility(
                visible: progressBarValue < 1,
                child: LinearProgressIndicator(
                  key: ValueKey(progressBarValue),
                  value: progressBarValue,
                ),
              );
            }),
        Expanded(
          child: WebViewWidget(controller: webViewController),
        )
      ]),
    );
  }
}
