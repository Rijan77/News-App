import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviewlab extends StatefulWidget {
  const Webviewlab({super.key});

  @override
  State<Webviewlab> createState() => _WebviewlabState();
}

class _WebviewlabState extends State<Webviewlab> {
  late WebViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://cloudtech.com.np/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text("Web View"),),
    body: WebViewWidget(controller: controller),
    );
  }
}
