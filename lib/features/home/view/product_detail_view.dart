import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../manager/product_provider.dart';
import '../model/product_model.dart';
import 'widgets/product_detail_view_body.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.title),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => GoRouter.of(context).pop(),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
              ),
            )
          ],
        ),
        body: ProductDetailViewBody(
          product: product,
        ),
      ),
    );
  }
}
