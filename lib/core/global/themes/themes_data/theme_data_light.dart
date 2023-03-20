import '../../../utils/styles.dart';
import 'package:flutter/material.dart';

import '../app_colors/app_colors_light.dart';

ThemeData getThemeDataLight(BuildContext context) => ThemeData(
      primarySwatch: AppColorsLight.kPrimaryColor,
      fontFamily: 'Metropolis',
      scaffoldBackgroundColor: AppColorsLight.kBackgroundColor,

      //text theme

      textTheme: const TextTheme(
        titleLarge: Styles.textStyles16,
        bodyMedium: Styles.textStyles14,
        headlineLarge: Styles.textStyles34,
        headlineMedium: Styles.textStyles34,
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

      //AppBar
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 1,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: Theme.of(context).textTheme.titleLarge),
    );
