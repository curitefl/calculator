import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//ディスプレイ部分
class DisplayArea extends StatefulWidget {
  const DisplayArea({Key? key}) : super(key: key);

  @override
  _DisplayAreaState createState() => _DisplayAreaState();
}

class _DisplayAreaState extends State<DisplayArea> {
  String _displayExpression = '1+1';

  // ディスプレイの再描画処理
  _UpdateDisplay(String letter) {
    setState(() {
      if (letter == '=' || letter == 'C') {
        _displayExpression = '';
      } else {
        _displayExpression += letter;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        child: Text(
          _displayExpression,
          style: TextStyle(
            fontSize: 64.0.sp,
          ),
        ),
      ),
    );
  }
}