import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Styles {
  static final textStyles11 = TextStyle(
    fontWeight: FontWeight.w400,
    color: AppColorsLight.kGreyColor,
    fontSize: 11.sp,
  );
  static final textStyles14 = TextStyle(
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontSize: 14.sp,
  );
  static final textStyles16 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColorsLight.kBlackColor,
    fontSize: 16.sp,
  );
  static final textStyles18 = TextStyle(
    fontWeight: FontWeight.w600,
    color: AppColorsLight.kBlackColor,
    fontSize: 18.sp,
  );
  static final textStyles24 = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    fontSize: 24.sp,
  );
  static final textStyles34 = TextStyle(
    fontWeight: FontWeight.bold,
    color: AppColorsLight.kBlackColor,
    fontSize: 34.sp,
  );
}
