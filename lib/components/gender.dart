import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final IconData genderIcon;
  final String label;
  const Gender({super.key, required this.genderIcon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 55.0,
          color: Colors.white,
        ),
        const SizedBox(height: 5.0),
        Text(label)
      ],
    );
  }
}
