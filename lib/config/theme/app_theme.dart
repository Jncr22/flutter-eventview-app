import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.black,
  Colors.black12,
  Colors.white,
  Colors.grey,
  Colors.purple
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'selected color must be greater then 0'),
      assert(selectedColor < colorList.length, 'selected color must be less or equal than ${colorList.length - 1 }');

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
  );
}
