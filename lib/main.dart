import 'package:bmi_app/components/refractor.dart';
// import 'package:bmi_app/components/reusable_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalulator());

class BMICalulator extends StatelessWidget {
  const BMICalulator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0A0C21),
        textTheme: const TextTheme(
          labelMedium: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
