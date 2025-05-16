import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewScreen extends StatefulWidget {
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
            // Handle market:// URLs
            if (request.url.startsWith('market://')) {
              if (await canLaunchUrl(Uri.parse(request.url))) {
                await launchUrl(Uri.parse(request.url));
                return NavigationDecision.prevent;
              }
            }

            // Handle regular URLs that should open in browser
            if (request.url != widget.url) {
              if (await canLaunchUrl(Uri.parse(request.url))) {
                await launchUrl(
                  Uri.parse(request.url),
                  mode: LaunchMode.externalApplication,
                );
                return NavigationDecision.prevent;
              }
            }

            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KOA Care'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
