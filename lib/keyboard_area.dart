//キーボード部分
import 'package:flutter/material.dart';

class KeyboardArea extends StatelessWidget {
  // @formatter:off
  var keyboardLabels = [
    '7', '8', '9', '÷',
    '4', '5', '6', '×',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ]; // @formatter:on

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GridView.count(
        crossAxisCount: 4,
        children: keyboardLabels.map((keyLabel) {
          return GridTile(
            child: Button(keyLabel),
          );
        }).toList(),
      ),
    );
  }
}

//ボタン部分
class Button extends StatelessWidget {
  var _keyLabel;

  Button(this._keyLabel);

  @override
  Widget build(BuildContext context) {
    return Text(_keyLabel);
  }
}