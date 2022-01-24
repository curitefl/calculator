import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//キーボード部分
class KeyboardArea extends StatelessWidget {
  const KeyboardArea({Key? key}) : super(key: key);

  // @formatter:off
  static const List<String> _keyboardLabels = [
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
        children: _keyboardLabels.map((keyLabel) {
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
          style: TextStyle(fontSize: 46.0.sp),
        ),
      ),
    );
  }
}