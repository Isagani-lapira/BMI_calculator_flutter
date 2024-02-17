import 'package:bmi_app/components/constants.dart';
import 'package:bmi_app/components/gender.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum GenderType { male, female, other }

class _HomePageState extends State<HomePage> {
  GenderType selectedGender = GenderType.other;

  double _currentSliderValue = 100.0;
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
            const Expanded(
              child: ReusableCard(
                color: kInactiveColor,
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
                  onPressed: () {},
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
