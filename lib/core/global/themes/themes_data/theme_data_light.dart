import '../../../utils/styles.dart';
import 'package:flutter/material.dart';

import '../app_colors/app_colors_light.dart';

ThemeData getThemeDataLight(BuildContext context) => ThemeData(
      primarySwatch: AppColorsLight.kPrimaryColor,
      fontFamily: 'Metropolis',
      scaffoldBackgroundColor: AppColorsLight.kBackgroundColor,

      //text theme

      textTheme: const TextTheme(
        bodyMedium: Styles.textStyles14,
        headlineLarge: Styles.textStyles34,
      ),

      //text form field

      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

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
        ),
      ),
    );
