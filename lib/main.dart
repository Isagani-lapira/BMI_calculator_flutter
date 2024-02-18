import 'package:bmi_app/components/home_page.dart';
import 'package:bmi_app/components/results_page.dart';
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
          bodyMedium: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/result': (context) => const ResultPage()
      },
    );
  }
}
