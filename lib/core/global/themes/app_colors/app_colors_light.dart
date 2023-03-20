import 'package:flutter/material.dart';

abstract class AppColorsLight {
  static final Map<int, Color> _color = {
    50: const Color.fromRGBO(136, 14, 79, .1),
    100: const Color.fromRGBO(136, 14, 79, .2),
    200: const Color.fromRGBO(136, 14, 79, .3),
    300: const Color.fromRGBO(136, 14, 79, .4),
    400: const Color.fromRGBO(136, 14, 79, .5),
    500: const Color.fromRGBO(136, 14, 79, .6),
    600: const Color.fromRGBO(136, 14, 79, .7),
    700: const Color.fromRGBO(136, 14, 79, .8),
    800: const Color.fromRGBO(136, 14, 79, .9),
    900: const Color.fromRGBO(136, 14, 79, 1),
  };

  static MaterialColor kPrimaryColor = MaterialColor(0xffDB3022, _color);

  static const kBlackColor = Color(0xff222222);
  static const kGreyColor = Color(0xff9B9B9B);
  static const kBackgroundColor = Color(0xffF9F9F9);
  static const kErrorColor = Color(0xffF01F0E);
  static const kSuccessColor = Color(0xff2AA952);
  static const kSaleColor = Color(0xffDB3022);
  static const kAmberColor = Color(0xffFFBA49);
  static const kSolidColor = Color(0xffDADADA);
  //static const kGreyTextColor = Color(0xffC4C4C4);
}
