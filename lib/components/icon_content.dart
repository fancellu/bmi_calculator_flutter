import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({required this.icon, required this.label});

  final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        const SizedBox(height: 15),
        Text(label, style: kLabelTextStyle)
      ],
    );
  }
}
