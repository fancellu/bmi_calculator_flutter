import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        elevation: 0,
        constraints: const BoxConstraints.tightFor(width: 56, height: 56),
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white));
  }
}
