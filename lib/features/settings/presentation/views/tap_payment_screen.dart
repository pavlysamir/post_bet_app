import 'package:flutter/material.dart';
import 'package:post_bet/core/utils/widgets/custom_title_text.dart';
import 'package:post_bet/features/settings/presentation/manager/settings_cubit/cubit/settings_cubit.dart';
import 'package:post_bet/features/settings/presentation/views/webview_view.dart';
import 'package:post_bet/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPaynet extends StatefulWidget {
  const WebViewPaynet({super.key, required this.uri});

  final String uri;

  @override
  State<WebViewPaynet> createState() => _WebViewPaynetState();
}

class _WebViewPaynetState extends State<WebViewPaynet> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController(); // Initialize the controller here
    controller?.loadRequest(Uri.parse(widget.uri));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    SettingsCubit.get(context).getPlans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.popUntil(
        //         context, ModalRoute.withName(AppRouter.kHomeLayOut));
        //   },
        //   icon: const Icon(Icons.arrow_back),
        // ),
        title: CustomTitleText(text: S.of(context).subscribe),
        actions: [
          IconButton(
              onPressed: () async {
                final message = ScaffoldMessenger.of(context);
                if (await controller!.canGoBack()) {
                  await controller!.goBack();
                } else {
                  message.showSnackBar(
                    const SnackBar(content: Text('No back history item')),
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
                    const SnackBar(content: Text('No forward history item')),
                  );
                  return;
                }
              },
              icon: const Icon(Icons.arrow_forward_ios)),
          IconButton(
              onPressed: () async {
                controller!.reload();
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: WebViewView(controller: controller!),
    );
  }
}
