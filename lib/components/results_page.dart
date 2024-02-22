import 'package:bmi_app/components/constants.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmiResults;
  final String bmiStatus;
  const ResultPage(
      {super.key, required this.bmiResults, required this.bmiStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Your Results',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: kInactiveColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // status
                      Text(
                        bmiStatus,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10.0),
                      // results
                      Text(
                        bmiResults.toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 64.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15.0),
                      const Text(
                        'Normal BMI range:',
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        '18,5 - 25 kg/m2',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  backgroundColor: kActiveColor,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text(
                  'Recalculate',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
