import 'package:flutter_demo/ui/demos/7_testing/calculator_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('default answer is 0', () {
    final manager = CalculatorManager();
    final answer = manager.answerNotifier.value;
    expect(answer, 0);
  });

  test('adds two numbers correctly', () {
    final manager = CalculatorManager();
    manager.add('2', '3');
    final answer = manager.answerNotifier.value;
    expect(answer, 5);
  });

  test('if a user enters string then throw exception', () {
    final manager = CalculatorManager();
    expect(() => manager.add('abc', '3'), throwsFormatException);
  });
}