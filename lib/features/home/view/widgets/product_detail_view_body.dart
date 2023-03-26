import 'package:e_commerce_app/features/home/manager/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_favorite.dart';
import '../../../../core/widgets/custom_rating_bar.dart';
import '../../model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/themes/app_colors/app_colors_light.dart';
import 'custom_drop_down.dart';

class ProductDetailViewBody extends StatefulWidget {
  const ProductDetailViewBody({super.key, required this.product});

  final ProductModel product;

  @override
  State<ProductDetailViewBody> createState() => _ProductDetailViewBodyState();
}  final _formKey = GlobalKey<FormState>();


class _ProductDetailViewBodyState extends State<ProductDetailViewBody> {

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ProductProvider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.product.imageUrl),
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
                      CustomDropDown(
                        itemsList: AppStrings.kItemSizeList,
                        hintText: AppStrings.kDropDownInitialSize,
                      ),
                      CustomDropDown(
                        itemsList: AppStrings.kItemColorList,
                        hintText: AppStrings.kDropDownInitialColor,
                      ),
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
                        widget.product.category,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '\$${widget.product.price}',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    widget.product.title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      CustomRatingBar(rating: widget.product.rate),
                      Text(
                        '(${widget.product.rate})',
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
                    height: 16.h,
                  ),
                  CustomElevatedButton(
                      text: 'ADD TO CART',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          providerData.addToCart(
                            id: widget.product.id,
                            price: widget.product.price,
                            title: widget.product.title,
                            imageUrl: widget.product.imageUrl,
                            color: providerData.color,
                            size: providerData.size,
                          );
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
