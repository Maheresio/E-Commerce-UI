import 'package:flutter/material.dart';

import '../../../core/utils/service_locator.dart';
import '../../cart/model/product_cart_model.dart';
import '../repo/home_repo_imp.dart';

class ProductProvider with ChangeNotifier {
  final _homeRepo = getIt.get<HomeRepoImp>();

  String size;
  String color;
  bool isFavorite;
  ProductProvider({
    this.size = '',
    this.color = '',
    this.isFavorite = false,
  });

  void copyWith({
    String? size,
    String? color,
  }) {
    this.size = size ?? this.size;
    this.color = color ?? this.color;
  }

  void updateSize(String size) => copyWith(size: size);

  void updateColor(String color) => copyWith(color: color);


  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> addToCart({
    required String id,
    required int price,
    required String title,
    required String imageUrl,
    required String color,
    required String size,
  }) async {
    await _homeRepo.addToCart(ProductCartModel(
      id: id,
      price: price,
      title: title,
      imageUrl: imageUrl,
      color: color,
      size: size,
    ));
  }
}
