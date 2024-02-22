import 'package:bmi_app/components/calculator_brain.dart';
import 'package:bmi_app/components/cirular_button.dart';
import 'package:bmi_app/components/constants.dart';
import 'package:bmi_app/components/gender.dart';
import 'package:bmi_app/components/results_page.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:flutter/material.dart';

import 'addminuscard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum GenderType { male, female, other }

class _HomePageState extends State<HomePage> {
  GenderType selectedGender = GenderType.other;

  double _currentSliderValue = 100.0;
  int _currentWeight = 50;
  int _currentAge = 18;

  void cardSelected(GenderType genderType) {
    setState(() {
      selectedGender = genderType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      color: (selectedGender == GenderType.male)
                          ? kActiveColor
                          : kInactiveColor,
                      onPressed: () => cardSelected(GenderType.male),
                      child: const Gender(
                        genderIcon: Icons.male,
                        label: 'Male',
                        style: kTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == GenderType.female
                          ? kActiveColor
                          : kInactiveColor,
                      onPressed: () => cardSelected(GenderType.female),
                      child: const Gender(
                        genderIcon: Icons.female,
                        label: 'Female',
                        style: kTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // slider
            Expanded(
              child: ReusableCard(
                color: kInactiveColor,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Height',
                        textAlign: TextAlign.center,
                        style: kTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(_currentSliderValue.round().toString(),
                              style: kHeightLabel),
                          const Text(
                            'cm',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: kActiveColor,
                            activeTrackColor: kActiveColor,
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15.0),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 24.0),
                            overlayColor: kOverlayColor),
                        child: Slider(
                            value: _currentSliderValue,
                            max: kMaxHeight,
                            min: kMinHeight,
                            onChanged: (double value) {
                              setState(() {
                                _currentSliderValue = value;
                              });
                            }),
                      ),
                    ]),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AddMinusCard(
                    label: 'Weight',
                    currentData: _currentWeight.toString(),
                    minusOnPressed: () {
                      setState(() {
                        (_currentWeight > 0)
                            ? _currentWeight -= 1
                            : _currentWeight;
                      });
                    },
                    addOnPressed: () {
                      setState(() {
                        (_currentWeight < 200)
                            ? _currentWeight += 1
                            : _currentWeight;
                      });
                    },
                  ),
                  AddMinusCard(
                    label: 'Age',
                    currentData: _currentAge.toString(),
                    minusOnPressed: () {
                      setState(() {
                        (_currentAge > 0) ? _currentAge -= 1 : _currentAge;
                      });
                    },
                    addOnPressed: () {
                      setState(() {
                        (_currentAge < 150) ? _currentAge += 1 : _currentAge;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    backgroundColor: const Color(0xFFEB1555),
                  ),
                  onPressed: () {
                    CalculatorBrain calc = CalculatorBrain(
                        height: _currentSliderValue.toInt(),
                        weight: _currentWeight);

                    double results = calc.calculateBMI();
                    String status = calc.bmiStatus();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        bmiResults: results,
                        bmiStatus: status,
                      );
                    }));
                  },
                  child: const Text(
                    'Calculate',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
