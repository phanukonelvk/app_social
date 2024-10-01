import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InAppWebViewController? webViewController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: InAppWebView(
          onCreateWindow: (controller, createWindowAction) async {
            return true;
          },
          initialUrlRequest: URLRequest(
            url: WebUri('https://forb-dev.bbbb.com.la/'),
          ),
          onWebViewCreated: (controller) {
            webViewController = controller;
            // _webViewController!.addJavaScriptHandler(
            //   handlerName: 'handlerFoo',
            //   callback: (arguments) {
            //     final billData = arguments[0];
            //     handleData(billData);
            //     return {"status": "success", "data": arguments};
            //   },
            // );
          },
          onConsoleMessage: (controller, consoleMessage) {
            debugPrint(consoleMessage.message);
          },
        ),
      ),
    );
  }
}
