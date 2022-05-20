import 'package:bmi_calculator_flutter/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator_flutter/components/icon_content.dart';
import 'package:bmi_calculator_flutter/components/reusable_card.dart';
import 'package:bmi_calculator_flutter/components/bottom_button.dart';
import 'package:bmi_calculator_flutter/constants.dart';
import 'package:bmi_calculator_flutter/components/round_icon_button.dart';
import 'package:bmi_calculator_flutter/calculator_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender { male, female }

class _InputPageState extends State<InputPage> {
  Gender? gender;
  int height = 180;
  int weight = 65;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () => setState(() => gender = Gender.male),
                      colour: Gender.male == gender
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: const IconContent(
                          label: "MALE",
                          icon: Icon(
                            FontAwesomeIcons.mars,
                            size: 60,
                            color: Colors.white,
                          ))),
                ),
                Expanded(
                    child: ReusableCard(
                        onPress: () => setState(() => gender = Gender.female),
                        colour: Gender.female == gender
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: const IconContent(
                            label: "FEMALE",
                            icon: Icon(
                              FontAwesomeIcons.venus,
                              size: 60,
                              color: Colors.white,
                            ))))
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("HEIGHT", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      const Text(" cm", style: kLabelTextStyle)
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0xFFEB1555).withAlpha(0x1f),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 25)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double value) {
                          setState(() => height = value.round());
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("WEIGHT", style: kLabelTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(weight.toString(), style: kNumberTextStyle),
                              const Text(" kg", style: kLabelTextStyle)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () => setState(() => weight--)),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () => setState(() => weight++)),
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("AGE", style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () => setState(() => age--)),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () => setState(() => age++)),
                          ],
                        )
                      ]),
                ))
              ],
            ),
          ),
          BottomButton(
              label: "CALCULATE",
              onTap: () {
                CalculatorBrain brain =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                            bmiResult: brain.getResult(),
                            bmiFormatted: brain.formatBMI(),
                            interpretation: brain.getInterpretation())));
              })
        ],
      ),
    );
  }
}
