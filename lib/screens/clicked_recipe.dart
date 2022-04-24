import 'package:final_project/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../models/recipe_model.dart';

class ClickedScreen extends StatefulWidget {
  final Recipe? clicked;

  const ClickedScreen({Key? key, required this.clicked}) : super(key: key);

  @override
  State<ClickedScreen> createState() => _ClickedScreenState();
}

class _ClickedScreenState extends State<ClickedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 40, 38, 38),
        title: Text('Result'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
            child: const Text("Logout"),
          )
        ],
      ),
      body: WebView(
        initialUrl: widget.clicked!.spoonacularSourceUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
