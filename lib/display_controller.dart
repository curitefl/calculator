import 'package:calculator/text_data.dart';
import 'package:get/get.dart';

import 'calculation.dart';

class DisplayController extends GetxController {
  final Rx<String> displayExpression = TextData.empty.obs;

  // 入力を受け付けるか判定する処理
  void inputPermission(String letter) {
    // もし画面が空で、数字以外が入力されたら受け付けない
    if (displayExpression.value == TextData.empty &&
        !TextData.checkNumber.contains(letter)) {
      return;
    }
    // 画面が空ではない、もしくは数字が入力されたら受け付ける
    else {
      updateDisplay(letter);
    }
  }

  // ディスプレイの再描画処理
  void updateDisplay(String letter) {
    // 計算結果が表示されている状態で、数字が入力されたら、表示をリセットする
    // 計算結果が表示されている状態で、四則演算子が入力されたら、表示はリセットしない
    if (Calculation.equalFlag == TextData.equalKey) {
      if (Calculation.numberKey.contains(letter)) {
        displayExpression.value = TextData.empty;
        Calculation.equalFlag = TextData.empty;
      }
    }

    // Cキーの場合
    if (letter == TextData.clearKey) {
      displayExpression.value = TextData.empty;
      Calculation.equalFlag = TextData.empty;
    }
    // =キーの場合
    else if (letter == TextData.equalKey) {
      displayExpression.value = TextData.empty;
      String ans = Calculation.execute();
      updateDisplay(ans);
      Calculation.getKey(ans);
      Calculation.equalFlag = TextData.equalKey;
    }
    // エラーの場合
    else if (letter == TextData.error) {
      displayExpression.value = TextData.error;
      Calculation.equalFlag = TextData.equalKey;
    }
    // 数字、四則演算子の場合
    else {
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