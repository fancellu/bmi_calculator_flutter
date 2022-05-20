import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight}) {
    _bmi = weight / pow(height / 100, 2);
  }

  final int height;
  final int weight;

  double _bmi = 0;

  String formatBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 24) {
      return "Overweight";
    } else if (_bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 24) {
      return "You have a higher than normal body weight, maybe try keto";
    } else if (_bmi >= 18.5) {
      return "You have a normal body weight, good job!";
    } else {
      return "You have a lower than normal body weight, maybe eat some more";
    }
  }
}
