import 'package:e_commerce_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../app_colors/app_colors_light.dart';

ThemeData getThemeDataLight() => ThemeData(
      primarySwatch: AppColorsLight.kPrimaryColor,
      fontFamily: 'Metropolis',
      scaffoldBackgroundColor: AppColorsLight.kBackgroundColor,

      //elevated button

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(AppColorsLight.kPrimaryColor),
        elevation: MaterialStateProperty.all(5),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        textStyle: MaterialStateProperty.all(Styles.textStyles14),
      )),
    );
