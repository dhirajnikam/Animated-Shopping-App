
import 'package:flutter/material.dart';

class Product {
  String title;
  String img;
  Color color;
  double price;
  bool fav;
  Product({
    required this.title,
    required this.img,
    required this.color,
    required this.price,
    required this.fav
  });
}
