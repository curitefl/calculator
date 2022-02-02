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

  static void clearVariable() {
    _operand = [0.0, 0.0];
    _operator = TextData.empty;
    _target = 0;
    _digitFlag = 0;
    resultFlag = true;
    _errorCheck = TextData.empty;
  }
}