import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/helpers/custom_status_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global/themes/app_colors/app_colors_light.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../manager/sale_products_cubit/sale_products_cubit.dart';

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
      child: BlocConsumer<SaleProductsCubit, SaleProductsState>(
        builder: (context, state) {
          if (state is SaleProductsFailure) {
            return Center(
              child: Text(
                'No data available',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColorsLight.kPrimaryColor,
                    ),
              ),
            );
          }
          if (state is SaleProductsSuccess) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ProductsListViewItem(
                state.saleProductsList.elementAt(index),
              ),
              itemCount: state.saleProductsList.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 18.w,
              ),
            );
          }
          return const CustomProgressIndicator();
        },
        listener: (context, state) {
          if (state is SaleProductsFailure) {
            customSnackBar(context, state.errorMsg);
          }
        },
      ),
    );
  }
}
