import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:e_commerce_app/core/utils/asset_data.dart';
import 'package:e_commerce_app/features/home/view/widgets/products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.asset(AssetData.kSmallBannerviewImage),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: 16.w,
              bottom: 26.h,
              child: Text(
                'Street clothes',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(start: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sale',
                      style: Theme.of(context).textTheme.headlineMedium),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: 10.w,
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text(
                        'View all',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColorsLight.kBlackColor,
                            ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              Text(
                'Super summer sale',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColorsLight.kGreyColor,
                    ),
              ),
              SizedBox(
                height: 22.h,
              ),
              const ProductsListView()
            ],
          ),
        )
      ],
    );
  }
}
