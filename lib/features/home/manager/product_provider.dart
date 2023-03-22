import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  bool isFavorite = false;
  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  
}
