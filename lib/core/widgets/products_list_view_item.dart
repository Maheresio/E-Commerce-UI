import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsListViewItem extends StatelessWidget {
  const ProductsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    image: const DecorationImage(
                        image: NetworkImage(
                          'https://joyfullystyled.com/wp-content/uploads/2020/02/pink-hat.jpg',
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
                      child: Text(
                        '-20%',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
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
                ...List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, color: AppColorsLight.kAmberColor),
                ),
                Text(
                  '(10)',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorsLight.kGreyColor,
                      ),
                )
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 5.w),
              child: Text(
                'Dorothy Perkins',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                'Evening Dress',
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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColorsLight.kSaleColor,
                        ),
                    children: [
                      TextSpan(
                        text: '15\$',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColorsLight.kGreyColor,
                              decoration: TextDecoration.lineThrough,
                              decorationThickness: 5,
                            ),
                      ),
                      const TextSpan(
                        text: '15\$',
                      ),
                    ]),
              ),
            ),
          ],
        ),
        Positioned.directional(
          bottom: 85.h,
          textDirection: TextDirection.ltr,
          child: GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                
                borderRadius: BorderRadius.circular(29),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                child: const Icon(Icons.favorite_border_outlined,color: AppColorsLight.kSolidColor,),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
