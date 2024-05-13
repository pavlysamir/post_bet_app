import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/views/webview_view.dart';
import 'package:post_bet/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPaynet extends StatefulWidget {
  const WebViewPaynet({super.key});

  @override
  State<WebViewPaynet> createState() => _WebViewPaynetState();
}

class _WebViewPaynetState extends State<WebViewPaynet> {
  WebViewController? controller; // Make it nullable

  @override
  void initState() {
    super.initState();
    controller = WebViewController(); // Initialize the controller here
    controller
        ?.loadRequest(Uri.parse("https://pub.dev/packages/webview_flutter"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTitleText(text: S.of(context).subscribe),
        actions: [
          IconButton(
              onPressed: () async {
                final message = ScaffoldMessenger.of(context);
                if (await controller!.canGoBack()) {
                  await controller!.goBack();
                } else {
                  message.showSnackBar(
                    SnackBar(content: Text(S.of(context).noBackHistoryItem)),
                  );
                  return;
                }
              },
              icon: const Icon(Icons.arrow_back_ios)),
          IconButton(
              onPressed: () async {
                final message = ScaffoldMessenger.of(context);
                if (await controller!.canGoForward()) {
                  await controller!.goForward();
                } else {
                  message.showSnackBar(
                    SnackBar(content: Text(S.of(context).noBackHistoryItem)),
                  );
                  return;
                }
              },
              icon: const Icon(Icons.arrow_forward_ios)),
          IconButton(
              onPressed: () async {
                controller!.reload();
              },
              icon: const Icon(Icons.arrow_forward_ios))
        ],
      ),
      body: WebViewView(controller: controller!),
    );
  }
}
