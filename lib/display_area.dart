import 'package:flutter/material.dart';

import 'text_data.dart';

//ディスプレイ部分
class DisplayArea extends StatefulWidget {
  const DisplayArea({Key? key}) : super(key: key);

  @override
  _DisplayAreaState createState() => _DisplayAreaState();
}

class _DisplayAreaState extends State<DisplayArea> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          _displayExpression,
          style: const TextStyle(
            fontSize: 64.0,
          ),
        ),
      ),
    );
  }
}