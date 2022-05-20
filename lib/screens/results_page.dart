import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  //const ResultsPage({Key? key}) : super(key: key);

  const ResultsPage(
      {required this.bmiResult,
      required this.bmiFormatted,
      required this.interpretation});

  final String bmiResult;
  final String bmiFormatted;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('BMI CALCULATOR')),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.bottomLeft,
                      child:
                          const Text('Your Result', style: kTitleTextStyle))),
              Expanded(
                  flex: 5,
                  child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(bmiResult.toUpperCase(), style: kResultTextStyle),
                        Text(bmiFormatted, style: kBMITextStyle),
                        Text(interpretation,
                            textAlign: TextAlign.center, style: kBodyTextStyle)
                      ],
                    ),
                  )),
              BottomButton(
                  label: "RE-CALCULATE", onTap: () => Navigator.pop(context))
            ]));
  }
}
