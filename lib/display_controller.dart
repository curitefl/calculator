import 'package:calculator/text_data.dart';
import 'package:get/get.dart';

import 'calculation.dart';
import 'text_data.dart';

class DisplayController extends GetxController {
  final Rx<String> displayExpression = TextData.empty.obs;

  // 入力を受け付けるか判定する処理
  void inputPermission(String letter) {
    // もし画面が空で、1~9以外が入力されたら受け付けない
    if (displayExpression.value == TextData.empty &&
        !TextData.allNumbers.substring(1).contains(letter)) {
      return;
    }
    // 画面が空ではない、もしくは数字が入力されたら受け付ける
    else {
      updateDisplay(letter);
    }
  }

  // ディスプレイの再描画処理
  void updateDisplay(String letter) {
    // Cキーの場合
    if (letter == TextData.clearKey) {
      displayExpression.value = TextData.empty;
      Calculation.instance.resultFlag = false;
    }
    // =キーの場合
    else if (letter == TextData.equalKey) {
      displayExpression.value = Calculation.instance
          .execute(displayExpression.value, displayExpression.value.length);
    }
    // エラーの場合
    else if (letter == TextData.error) {
      displayExpression.value = TextData.error;
      Calculation.instance.resultFlag = false;
    }
    // 数字、四則演算子の場合
    else {
      // 画面が空ではなく
      if (displayExpression.value != TextData.empty) {
        final int last = displayExpression.value.length - 1;
        // 画面末尾が四則演算子かつ、四則演算子が入力されたら、入力された演算子に置き換える
        if (TextData.allOperators.contains(displayExpression.value[last]) &&
            TextData.allOperators.contains(letter)) {
          replaceOperator(letter);
          return;
        }
      }
      // 結果画面で
      if (Calculation.instance.resultFlag == true) {
        // 数字が入力されたら、画面とFlagを空にする
        if (TextData.allNumbers.contains(letter)) {
          displayExpression.value = TextData.empty;
          Calculation.instance.resultFlag = false;
        }
        // 四則演算子が入力されたら、Flagを空にする
        else if (TextData.allOperators.contains(letter)) {
          Calculation.instance.resultFlag = false;
        }
      }
      displayExpression.value += letter;
    }
  }

  // 四則演算子を置き換える処理
  void replaceOperator(String letter) {
    String _displayExpressionBuffer = displayExpression.value
        .substring(0, displayExpression.value.length - 1);
    _displayExpressionBuffer += letter;
    displayExpression.value = _displayExpressionBuffer;
  }
}
