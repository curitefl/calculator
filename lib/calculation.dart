import 'text_data.dart';

class Calculation {
  static const String checkOperator = '+-×÷';
  static const String numberKey = '0123456789';
  static final List<double> _numberList = [];
  static final List<String> _operatorList = [];
  static String _numberBuffer = TextData.empty;
  static String equalFlag = TextData.empty;
  static double _result = 0.0;

  // 四則演算子と数字を振り分ける処理
  static void getKey(String letter) {
    // 四則演算子の場合
    if (checkOperator.contains(letter)) {
      _operatorList.add(letter);
      _numberList.add(double.parse(_numberBuffer));
      _numberBuffer = TextData.empty;
    }
    // Cキーの場合
    else if (letter == TextData.clearKey) {
      _numberList.clear();
      _operatorList.clear();
      _numberBuffer = TextData.empty;
    }
    // =キーの場合
    else if (letter == TextData.equalKey) {
      // if (Calculation.equalFlag == TextData.equalKey) {
      _numberBuffer = TextData.empty;
      // }
    }
    // 数字の場合
    else {
      _numberBuffer += letter;
    }
  }

  // 計算処理
  static String execute() {
    _numberList.add(double.parse(_numberBuffer));
    // equalFlag = TextData.equalKey;

    if (_numberList.isEmpty) {
      return TextData.zero;
    }

    _result = _numberList[0];
    for (int i = 0; i < _operatorList.length; i++) {
      // +キーの場合
      if (_operatorList[i] == checkOperator[0]) {
        _result += _numberList[i + 1];
      }
      // -キーの場合
      else if (_operatorList[i] == checkOperator[1]) {
        _result -= _numberList[i + 1];
      }
      // ×キーの場合
      else if (_operatorList[i] == checkOperator[2]) {
        _result *= _numberList[i + 1];
      }
      // ÷キーの場合
      else if (_operatorList[i] == checkOperator[3] &&
          _numberList[i + 1] != 0) {
        _result /= _numberList[i + 1];
      }
      // 四則演算子以外の場合
      else {
        return TextData.error;
      }
    }

    _numberList.clear();
    _operatorList.clear();
    _numberBuffer = TextData.empty;

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
}