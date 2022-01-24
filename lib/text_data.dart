class TextData {
  // main.dart用
  static const String appTitle = '電卓アプリ';

  // display_area.dart用
  static const String displayExpression = '1+1';
  static const double displayExpressionFontSize = 64.0;
  static const int displayAreaFlex = 1;

  // keyboard_area.dart用
  static const int keyBoardAreaCrossAxisCount = 4;
  static const double keyLabelFontSize = 46.0;
  static const int keyBoardAreaFlex = 2;

  // @formatter:off
  static const List<String> keyboardLabels = [
    '7', '8', '9', '÷',
    '4', '5', '6', '×',
    '1', '2', '3', '-',
    'C', '0', '=', '+',
  ]; // @formatter:on
}