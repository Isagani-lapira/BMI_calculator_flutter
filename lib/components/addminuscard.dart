
import 'package:flutter/material.dart';

import 'cirular_button.dart';
import 'constants.dart';
import 'reusable_card.dart';

class AddMinusCard extends StatelessWidget {
  final String label;
  final String currentData;
  final Function() minusOnPressed;
  final Function() addOnPressed;
  const AddMinusCard(
      {super.key,
      required this.label,
      required this.currentData,
      required this.minusOnPressed,
      required this.addOnPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: kInactiveColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: kTextStyle,
            ),
            Text(
              currentData.toString(),
              style: kHeightLabel,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  icon: Icons.remove,
                  onPressed: minusOnPressed,
                ),
                CircleButton(
                  icon: Icons.add,
                  onPressed: addOnPressed,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
