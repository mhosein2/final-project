import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/recipe_model.dart';

class ClickedScreen extends StatefulWidget {
  final Recipe? clicked;

  ClickedScreen({required this.clicked});

  @override
  State<ClickedScreen> createState() => _ClickedScreenState();
}

class _ClickedScreenState extends State<ClickedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: WebView(
        initialUrl: widget.clicked!.spoonacularSourceUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
