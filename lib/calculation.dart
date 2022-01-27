import 'text_data.dart';

const List<String> _checkOperator = ['+', '-', '×', '÷'];

class Calculation {
  static final List<double> _numberList = [];
  static final List<String> _operatorList = [];
  static String _numberBuffer = TextData.empty;
  static double _result = 0.0;

  // 四則演算子と数字を振り分ける処理
  static void getKey(String letter) {
    // 四則演算子の場合
    if (_checkOperator.contains(letter)) {
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
      return;
    }
    // 数字の場合
    else {
      _numberBuffer += letter;
    }
  }

  // 計算処理
  static String execute() {
    _numberList.add(double.parse(_numberBuffer));

    if (_numberList.isEmpty) {
      return TextData.zero;
    }

    _result = _numberList[0];
    for (int i = 0; i < _operatorList.length; i++) {
      if (_operatorList[i] == '+') {
        _result += _numberList[i + 1];
      } else if (_operatorList[i] == '-') {
        _result -= _numberList[i + 1];
      } else if (_operatorList[i] == '×') {
        _result *= _numberList[i + 1];
      } else if (_operatorList[i] == '÷' && _numberList[i + 1] != 0) {
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

    List<String> resultStr = _result.toString().split(TextData.decimalPoint);
    return resultStr[1] == TextData.zero ? resultStr[0] : _result.toString();
  }
}