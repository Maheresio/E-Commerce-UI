// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/features/cart/model/product_cart_model.dart';
import 'package:e_commerce_app/features/home/repo/home_repo_imp.dart';

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
    bool? isFavorite,
  }) {
    this.size = size ?? '';
    this.color = color ?? '';
    this.isFavorite = isFavorite ?? false;
  }

  void updateSize(String size) => copyWith(size: size);
  void updateColor(String color) => copyWith(color: color);
  void updateIsFavorite(bool isFavorite) => copyWith(isFavorite: isFavorite);

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
