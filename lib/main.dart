import 'package:flutter/material.dart';

import 'display_area.dart';
import 'keyboard_area.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String appTitle = '電卓アプリ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DisplayArea(),
            KeyboardArea(),
          ],
        ),
      ),
    );
  }
}