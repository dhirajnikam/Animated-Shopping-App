import 'package:flutter/material.dart';

List myList = [
  {'col': col},
  {'addcol': addcol},
  {'fav': fav},
];

List<bool> fav = List.filled(col.length, true);
List addImg = [];
List<double> addText = [];
double total = addText.reduce((value, element) => value + element);

List t_Text = List<String>.generate(img.length, (index) => "${index + 1 * 2}");
List<bool> remove = List.filled(addText.length, true);
List col = [
  Colors.amber,
  Colors.cyan,
  Colors.red,
  Colors.green,
  Colors.green.shade100,
  Colors.indigo.shade100,
  Colors.grey.shade300,
  Colors.lightGreen.shade100,
  Colors.cyan.shade900,
  Colors.red.shade900,
  Colors.green.shade900,
  Colors.red.shade500
];
List img = [
  "nike_assets/J_001.png",
  "nike_assets/J_002.png",
  "nike_assets/J_003.png",
  "nike_assets/J_004.png",
  "nike_assets/N_001.png",
  "nike_assets/N_002.png",
  "nike_assets/N_003.png",
  "nike_assets/N_004.png",
  "nike_assets/Z_001.png",
  "nike_assets/Z_002.png",
  "nike_assets/Z_003.png",
  "nike_assets/Z_004.png",
];
List addcol = [];
