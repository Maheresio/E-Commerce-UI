import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/themes/app_colors/app_colors_light.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/widgets/products_list_view_item.dart';
import '../../model/product_model.dart';
import '../../repo/home_repo_imp.dart';

class NewProductsListView extends StatelessWidget {
  const NewProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285.h,
      width: double.infinity,
      child: StreamBuilder<List<ProductModel>>(
          stream: getIt.get<HomeRepoImp>().getNewProducts(),
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
                        !.copyWith(color: AppColorsLight.kPrimaryColor),
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
