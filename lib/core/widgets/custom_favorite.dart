import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../features/home/manager/product_provider.dart';

class CustomFavorite extends StatelessWidget {
  const CustomFavorite({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<ProductProvider>(context);

    return InkWell(
      onTap: onTap,
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        borderRadius: BorderRadius.circular(29),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(29),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: providerData.isFavorite
                ? const Icon(
                    Icons.favorite_border,
                    color: AppColorsLight.kAmberColor,
                  )
                : const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black38,
                  ),
          ),
        ),
      ),
    );
  }
}
