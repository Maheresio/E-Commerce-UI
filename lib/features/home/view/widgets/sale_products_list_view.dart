import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:e_commerce_app/core/utils/service_locator.dart';
import 'package:e_commerce_app/core/widgets/custom_progress_indicator.dart';
import 'package:e_commerce_app/features/home/model/product_model.dart';
import 'package:e_commerce_app/features/home/repo/home_repo_imp.dart';
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
      child: StreamBuilder<List<ProductModel>>(
          stream: getIt.get<HomeRepoImp>().getSaleProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final products = snapshot.data;
              if (products == null || products.isEmpty) {
                return Center(
                  child: Text(
                    'No data available',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: AppColorsLight.kPrimaryColor),
                  ),
                );
              }
              return ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    ProductsListViewItem(snapshot.data![index]),
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(
                  width: 18.w,
                ),
              );
            }
            return const CustomProgressIndicator();
          }),
    );
  }
}
