import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/asset_data.dart';
import '../../../../core/widgets/featured_list_view.dart';
import 'new_products_list_view.dart';
import 'sale_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                FeaturedListView(
                  title: AppStrings.kSaleTitle,
                  subtitle: AppStrings.kSaleSubtitle,
                  listView:  const SaleProductsListView(),
                  onPressed: () {},
                ),
                FeaturedListView(
                  title: AppStrings.kNewTitle,
                  subtitle: AppStrings.kNewSubtitle,
                  listView:  const NewProductsListView(),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
