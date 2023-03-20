import 'package:e_commerce_app/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
      ),
      body: const ProductDetailViewBody(),
    );
  }
}
