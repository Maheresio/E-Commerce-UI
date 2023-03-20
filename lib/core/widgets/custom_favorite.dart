import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global/themes/app_colors/app_colors_light.dart';

class CustomFavorite extends StatelessWidget {
  const CustomFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Material(
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
            child: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.black26,
            ),
          ),
        ),
      ),
    );
  }
}
