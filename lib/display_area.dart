//ディスプレイ部分
import 'package:flutter/material.dart';

class DisplayArea extends StatefulWidget {
  _DisplayAreaState createState() => _DisplayAreaState();
}

class _DisplayAreaState extends State<DisplayArea> {
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
