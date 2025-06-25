import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0, 'El color seleccionado debe ser mayor a cero'),
      assert(selectedColor< colorList.length,
        'El color debe ser menor a ${colorList.length-1}');

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: false,
    )
  );
}
