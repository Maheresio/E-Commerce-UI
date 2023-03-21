import 'package:e_commerce_app/core/widgets/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widgets/custom_favorite.dart';
import 'package:e_commerce_app/core/widgets/custom_rating_bar.dart';
import 'package:e_commerce_app/features/home/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/themes/app_colors/app_colors_light.dart';
import 'custom_drop_down.dart';

class ProductDetailViewBody extends StatelessWidget {
  const ProductDetailViewBody({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.imageUrl),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomDropDown(),
                    CustomDropDown(),
                    CustomFavorite(),
                  ],
                ),
                SizedBox(
                  height: 22.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'H&M',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '\$19.99',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Text(
                  'Short black dress',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    const CustomRatingBar(),
                    Text(
                      '(${product.rating})',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppColorsLight.kGreyColor,
                          ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w400, letterSpacing: .5),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomElevatedButton(text: 'ADD TO CART', onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
