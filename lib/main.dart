import 'package:flutter/material.dart';
import 'web_view_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KOA Care Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WebViewScreen(
                  url:
                      'https://your360.stg.koa.care/preselected_customer?customerId=f0eb4d5f-acd2-48f3-9ac2-287dbac8b0b2',
                ),
              ),
            );
          },
          child: const Text('Open KOA Care'),
        ),
      ),
    );
  }
}
