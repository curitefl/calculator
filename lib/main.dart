import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = '電卓アプリ';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Display(),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}

//ディスプレイ部分
class Display extends StatefulWidget {
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  String _expression = '1+1';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          _expression,
          style: TextStyle(
            fontSize: 64.0,
          ),
        ),
      ),
    );
  }
}

//キーボード部分
class Keyboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Keyboard');
  }
}

//ボタン部分
class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Botton');
  }
}