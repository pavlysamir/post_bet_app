import 'package:flutter/material.dart';
import 'package:post_bet/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewView extends StatefulWidget {
  const WebViewView({super.key, required this.controller});

  final WebViewController controller;

  @override
  State<WebViewView> createState() => _WebViewViewState();
}

class _WebViewViewState extends State<WebViewView> {
  var loadingPercentAge = 0;

  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              loadingPercentAge = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              loadingPercentAge = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              loadingPercentAge = 100;
            });
          },
        ),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel("SnackBar", onMessageReceived: (message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message.message)));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: widget.controller),
        if (loadingPercentAge < 100)
          LinearProgressIndicator(
            value: loadingPercentAge / 100.0,
            backgroundColor: kPrimaryKey,
          ),
      ],
    );
  }
}
