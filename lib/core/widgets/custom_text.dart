import 'package:flutter/material.dart';

import '../global/themes/app_colors/app_colors_light.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColorsLight.kBlackColor,
          ),
    );
  }
}
