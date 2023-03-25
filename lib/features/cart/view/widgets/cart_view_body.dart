import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:e_commerce_app/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/features/cart/view/widgets/cart_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              AppStrings.myCart,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 30.h,
            ),
            const CartListView(),
              SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.kCartTotalAmount,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColorsLight.kGreyColor,
                      ),
                ),
                Text(
                  '124\$',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomElevatedButton(text: AppStrings.kCheckout, onPressed: () {}),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
