import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webviwe extends StatefulWidget {
  const Webviwe({super.key, required this.url});
  final String url;
  @override
  State<Webviwe> createState() => _WebviweState();
}

class _WebviweState extends State<Webviwe> {
  WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          scrolledUnderElevation: 0, backgroundColor: Colors.transparent),
      body: WebViewWidget(controller: controller),
    );
  }
}
