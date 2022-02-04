// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator/calculation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Calculation Test', () {
    test('1+1=', () {
      var calculation = Calculation();
      var expression = '1+1';
      var result = calculation.execute(expression);
      expect('2', result);
      calculation.clearVariable();
    });
    test('1-1-10=', () {
      var calculation = Calculation();
      var expression = '1-1-10';
      var result = calculation.execute(expression);
      expect('-10', result);
    });
    test('2×3×5=', () {
      var calculation = Calculation();
      var expression = '2×3×5';
      var result = calculation.execute(expression);
      expect('30', result);
    });
    test('60÷2÷3=', () {
      var calculation = Calculation();
      var expression = '60÷2÷3';
      var result = calculation.execute(expression);
      expect('10', result);
    });
    test('100÷5+10×2-5', () {
      var calculation = Calculation();
      var expression = '100÷5+10×2-5';
      var result = calculation.execute(expression);
      expect('55', result);
    });
    // test('9-+×÷3=', () {
    var calculation = Calculation();
    //   var expression = '9-+×÷3';
    //   var result = calculation.execute(expression);
    //   expect('3', result);
    // });
    test('1+1====', () {
      var calculation = Calculation();
      var expression = '1+1';
      var expects = ['2', '3', '4', '5'];
      var equalCount = 4;
      for (var i = 0; i < equalCount; ++i) {
        expression = calculation.execute(expression);
        var result = expression;
        expect(expects[i], result);
      }
    });
    test('2×2====', () {
      var calculation = Calculation();
      var expression = '2×2';
      var expects = ['4', '8', '16', '32'];
      var equalCount = 4;
      for (var i = 0; i < equalCount; ++i) {
        expression = calculation.execute(expression);
        var result = expression;
        expect(expects[i], result);
      }
    });
    test('1024÷2====', () {
      var calculation = Calculation();
      var expression = '1024÷2';
      var expects = ['512', '256', '128', '64'];
      var equalCount = 4;
      for (var i = 0; i < equalCount; ++i) {
        expression = calculation.execute(expression);
        var result = expression;
        expect(expects[i], result);
      }
    });
    test('50-5====', () {
      var calculation = Calculation();
      var expression = '50-5';
      var expects = ['45', '40', '35', '30'];
      var equalCount = 4;
      for (var i = 0; i < equalCount; ++i) {
        expression = calculation.execute(expression);
        var result = expression;
        expect(expects[i], result);
      }
    });
    test('5+=+=+=+=', () {
      var calculation = Calculation();
      var expression = '5+';
      var expects = ['10', '20', '40', '80'];
      var equalCount = 2;
      for (var i = 0; i < equalCount; ++i) {
        expression = calculation.execute(expression);
        var result = expression;
        expression = result + '+';
        expect(expects[i], result);
      }
    });
    // test('2×=×=×=×=', () {
    // var calculation = Calculation();
    //   var expression = '2×=×=×=×';
    //   var result = calculation.execute(expression);
    //   expect('4, 16, 256, 65536', result);
    // });
    // test('256÷=÷=÷=÷=', () {
    // var calculation = Calculation();
    //   var expression = '256÷=÷=÷=÷';
    //   var result = calculation.execute(expression);
    //   expect('1, 1, 1, 1', result);
    // });
    test('32÷0', () {
      var calculation = Calculation();
      var expression = '32÷0';
      var result = calculation.execute(expression);
      expect('Error', result);
    });
  });
}
