import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/constants.dart';

class BottomButton extends StatelessWidget {
  // const BottomButton({
  //   Key? key,
  // }) : super(key: key);

  const BottomButton({required this.label, required this.onTap});

  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      child: Container(
          color: const Color(0xFFEB1555),
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(bottom: 20),
          width: double.infinity,
          height: kBottomContainerHeight,
          child: Center(child: Text(label, style: kLargeButtonTextStyle))),
    );
  }
}
