const List<String> _checkOperator = ['+', '-', '×', '÷'];

class Calculation {
  static final List<double> _numberList = [];
  static final List<String> _operatorList = [];
  static String _numberBuffer = '';

  // 四則演算子と数字を振り分ける処理
  static void getKey(String letter) {
    // 四則演算子の場合
    if (_checkOperator.contains(letter)) {
      _operatorList.add(letter);
      _numberList.add(double.parse(_numberBuffer));
      _numberBuffer = '';
    }
    // Cキーの場合
    else if (letter == 'C') {
      _numberList.clear();
      _operatorList.clear();
      _numberBuffer = '';
    }
    // =キーの場合
    else if (letter == '=') {
      return;
    }
    // 数字の場合
    else {
      _numberBuffer += letter;
    }
  }

  // 計算処理
  static String execute() {
    int result = 0;
    // TODO
    return result.toString();
  }
}
