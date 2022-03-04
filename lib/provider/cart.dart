import 'package:a/models/product.dart';
import 'package:flutter/material.dart';

class My_cartL extends ChangeNotifier {
  List<Product> _cart = [];
  double T_price = 0;
  void addToCart(Product product) {
    _cart.add(product);
    T_price += product.price;
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product);
    T_price -= product.price;
    notifyListeners();
  }

  List<Product> get cart {
    return _cart;
  }

  int get count {
    return _cart.length;
  }

  double get totalprice {
    return T_price;
  }
}
