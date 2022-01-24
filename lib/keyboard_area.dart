import 'package:flutter/material.dart';

import 'text_data.dart';

//キーボード部分
class KeyboardArea extends StatelessWidget {
  const KeyboardArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: TextData.keyBoardAreaFlex,
      child: GridView.count(
        crossAxisCount: TextData.keyBoardAreaCrossAxisCount,
        children: TextData.keyboardLabels.map((keyLabel) {
          return GridTile(
            child: TouchButton(keyLabel),
          );
        }).toList(),
      ),
    );
  }
}

//ボタン部分
class TouchButton extends StatelessWidget {
  final String _keyLabel;

  const TouchButton(this._keyLabel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Center(
        child: Text(
          _keyLabel,
          style: const TextStyle(fontSize: TextData.keyLabelFontSize),
        ),
      ),
    );
  }
}