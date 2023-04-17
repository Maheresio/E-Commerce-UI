import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../../features/home/manager/product_provider.dart';
import '../utils/app_routes.dart';
import 'custom_favorite.dart';
import 'custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/model/product_model.dart';
import '../global/themes/app_colors/app_colors_light.dart';

class ProductsListViewItem extends StatelessWidget {
  const ProductsListViewItem(this.product, {super.key});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ProductProvider>(context);

    return InkWell(
      onTap: () => GoRouter.of(context).push(
        AppRoutes.kProductDetailViewRoute,
        extra: product,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            product.imageUrl,
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 8.h, start: 9.w),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColorsLight.kSaleColor,
                        borderRadius: BorderRadius.circular(29),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 7.h,
                        ),
                        child: FittedBox(
                          child: Text(
                            '${product.discountValue}%',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8.h,
              ),
              Row(
                children: [
                  CustomRatingBar(rating: product.rate),
                  Text(
                    '(${product.rate})',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColorsLight.kGreyColor,
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w),
                child: Text(
                  product.category,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColorsLight.kGreyColor,
                      ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w),
                child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(start: 5.w),
                child: Text.rich(
                  TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppColorsLight.kSaleColor,
                          ),
                      children: [
                        TextSpan(
                          text: '15\$',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppColorsLight.kGreyColor,
                                    decoration: TextDecoration.lineThrough,
                                    decorationThickness: 5,
                                  ),
                        ),
                        TextSpan(
                          text: '${product.price}\$',
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Positioned.directional(
            bottom: 85.h,
            textDirection: TextDirection.ltr,
            child: CustomFavorite(
              onTap: (providerData.toggleFavorite),
            ),
          ),
        ],
      ),
    );
  }
}
