import 'package:calculator/calculation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'calculation.dart';
import 'text_data.dart';

class DisplayController extends GetxController {
  final Rx<String> displayExpression = TextData.empty.obs;

  // ディスプレイの再描画処理
  void updateDisplay(String letter) {
    // Cキーの場合
    if (letter == TextData.clearKey) {
      displayExpression.value = TextData.empty;
    }
    // =キーの場合
    else if (letter == TextData.equalKey) {
      displayExpression.value = TextData.empty;
      var ans = Calculation.execute();
      displayExpression.value = ans;
    }
    // エラーの場合
    else if (letter == TextData.error) {
      displayExpression.value = TextData.error;
    }
    // 数字、四則演算子の場合
    else {
      displayExpression.value += letter;
    }
  }
}

//ディスプレイ部分
class DisplayArea extends StatelessWidget {
  final DisplayController _displayController;

  DisplayArea({Key? key})
      : _displayController = Get.find<DisplayController>(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          alignment: Alignment.centerRight,
          child: Obx(
                () => Text(
              _displayController.displayExpression.value,
              style: TextStyle(
                fontSize: 64.0.sp,
              ),
            ),
          )),
    );
  }
}