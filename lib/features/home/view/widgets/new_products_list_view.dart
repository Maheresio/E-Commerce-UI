import '../../manager/new_products_cubit/new_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/themes/app_colors/app_colors_light.dart';
import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/widgets/custom_progress_indicator.dart';
import '../../../../core/widgets/products_list_view_item.dart';

class NewProductsListView extends StatelessWidget {
  const NewProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285.h,
      width: double.infinity,
      child: BlocConsumer<NewProductsCubit, NewProductsState>(
        builder: (context, state) {
          if (state is NewProductsFailure) {
            return Center(
              child: Text(
                'No data available',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColorsLight.kPrimaryColor,
                    ),
              ),
            );
          }
          if (state is NewProductsSuccess) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ProductsListViewItem(
                state.newProductsList.elementAt(index),
              ),
              itemCount: state.newProductsList.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(
                width: 18.w,
              ),
            );
          }

          return const CustomProgressIndicator();
        },
        listener: (context, state) {
          if (state is NewProductsFailure) {
            customSnackBar(context, state.errorMsg);
          }
        },
      ),
    );
  }
}
