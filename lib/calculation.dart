import 'text_data.dart';

class Calculation {
  static List<double> _operand = [0.0, 0.0];
  static int _target = 0;
  static int _digitFlag = 0;
  static String _operator = TextData.empty;
  static String _errorCheck = TextData.empty;
  static double _operandBuffer = 0.0;
  static String _operatorBuffer = TextData.empty;
  static bool resultFlag = false;

  // 計算処理
  static String execute(String expression, int length) {
    // expressionが1文字以上あるかチェック、なかったらエラーを返す
    if (expression.isEmpty) {
      return TextData.error;
    }
    // 文字列の1文字目から順に何が入っているか調べていく
    for (int i = 0; i < length; i++) {
      // もし数字だったら
      if (TextData.checkNumber.contains(expression[i])) {
        assert(_target < _operand.length && _target >= 0,
            '_targetの値は $_target です。_targetは0~1の範囲にしてください。');
        // _operandに格納する
        _operand[_target] =
            _operand[_target] * _digitFlag * 10.0 + double.parse(expression[i]);
        // 桁上がりを有効にする
        _digitFlag = 1;
      }
      // もし四則演算子で
      else {
        // operatorに既に四則演算子が格納されていたら、計算をする
        if (_operator != TextData.empty) {
          _errorCheck = calculate(_operator);
          if (_errorCheck == TextData.error) {
            clearVariable();
            return TextData.error;
          }
        }
        // 演算子を格納する
        _operator = expression[i];
        // 数字の格納先を変える
        _target = 1;
        // 桁上がりを無効にする
        _digitFlag = 0;
      }
    }

    // 結果の画面で、イコールを押したら、直前と同じ被演算子と演算子を使う
    if (resultFlag == true) {
      _operand[1] = _operandBuffer;
      _operator = _operatorBuffer;
    } else if (TextData.checkOperator
        .contains(expression[expression.length - 1])) {
      _operand[1] = _operand[0];
    }

    _errorCheck = calculate(_operator);
    if (_errorCheck == TextData.error) {
      clearVariable();
      return TextData.error;
    }

    expression = _operand[0].toString();

    // 次回、演算子で終わる計算だった場合に使う、数字と演算子を格納しておく
    _operandBuffer = _operand[1];
    _operatorBuffer = _operator;

    clearVariable();
    List<String> resultStr = expression.split(TextData.decimalPoint);
    return resultStr[1] == TextData.zero ? resultStr[0] : expression.toString();
  }

  // 加減乗除の処理
  static String calculate(String operator) {
    if (operator == TextData.plus) {
      _operand[0] += _operand[1];
    } else if (operator == TextData.minus) {
      _operand[0] -= _operand[1];
    } else if (operator == TextData.multiply) {
      _operand[0] *= _operand[1];
    } else if (operator == TextData.divide && _operand[1] != 0) {
      _operand[0] /= _operand[1];
    } else {
      return TextData.error;
    }
    return TextData.empty;
  }

  static void clearVariable() {
    _operand = [0.0, 0.0];
    _operator = TextData.empty;
    _target = 0;
    _digitFlag = 0;
    resultFlag = true;
    _errorCheck = TextData.empty;
  }
}
