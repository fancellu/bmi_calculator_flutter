import 'package:flutter/material.dart';
import 'package:material_color_gen/material_color_gen.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

var colorScheme = ColorScheme.fromSwatch(
    primarySwatch: const Color(0xFF0A0E21).toMaterialColor(),
    accentColor: Colors.purple);

var theme = ThemeData(
    textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
    scaffoldBackgroundColor: const Color(0xFF0A0E21),
    colorScheme: colorScheme);

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: InputPage(),
    );
  }
}
