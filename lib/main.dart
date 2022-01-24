import 'package:flutter/material.dart';

import 'display_area.dart';
import 'keyboard_area.dart';
import 'text_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TextData.appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(TextData.appTitle),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            DisplayArea(),
            KeyboardArea(),
          ],
        ),
      ),
    );
  }
}