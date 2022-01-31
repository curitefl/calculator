import 'package:calculator/text_data.dart';
import 'package:get/get.dart';

import 'calculation.dart';

class DisplayController extends GetxController {
  final Rx<String> displayExpression = TextData.empty.obs;

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
      Calculation.equalFlag = TextData.empty;
    }
  }
}
