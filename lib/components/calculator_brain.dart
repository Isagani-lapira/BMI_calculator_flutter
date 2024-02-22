import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  const CalculatorBrain({required this.height, required this.weight});

  double calculateBMI() => weight / (pow((height / 100), 2));

  String bmiStatus() {
    String status;
    double bmi = calculateBMI();

    if (bmi < 18.5) {
      status = 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      status = 'Normal';
    } else {
      status = bmi >= 25 && bmi < 30 ? 'Overweight' : 'Obese';
    }

    return status;
  }
}
