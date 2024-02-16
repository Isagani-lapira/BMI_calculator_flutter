import 'package:bmi_app/components/gender.dart';
import 'package:bmi_app/components/reusable_card.dart';
import 'package:flutter/material.dart';

const Color activeCard = Color(0xFFEB1555);
const Color inactiveCard = Color(0xFF1D1E33);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum GenderType { male, female, other }

class _HomePageState extends State<HomePage> {
  GenderType selectedGender = GenderType.other;

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
                          ? activeCard
                          : inactiveCard,
                      onPressed: () => cardSelected(GenderType.male),
                      child:
                          const Gender(genderIcon: Icons.male, label: 'Male'),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: selectedGender == GenderType.female
                          ? activeCard
                          : inactiveCard,
                      onPressed: () => cardSelected(GenderType.female),
                      child: const Gender(
                          genderIcon: Icons.female, label: 'Female'),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: ReusableCard(
                color: inactiveCard,
              ),
            ),
            const Expanded(
              child: ReusableCard(
                color: inactiveCard,
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
