import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  const CircleButton({super.key, this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(width: 40.0, height: 40.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xff4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
