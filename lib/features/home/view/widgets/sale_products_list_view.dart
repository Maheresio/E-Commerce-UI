import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/products_list_view_item.dart';

class SaleProductsListView extends StatelessWidget {
  const SaleProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285.h,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const ProductsListViewItem(),
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(
          width: 18.w,
        ),
      ),
    );
  }
}
