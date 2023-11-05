import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String paymentUrl;
  const WebViewScreen({super.key, required this.paymentUrl});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();

    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            Get.back();
            if (request.url.endsWith('tran_type=success')) {
              Get.snackbar(
                'Success!',
                'Payment Successful.',
                backgroundColor: Colors.green,
              );
            } else {
              Get.snackbar(
                'Failed!',
                'Payment Failed. Try again.',
                backgroundColor: Colors.red,
              );
            }
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}
