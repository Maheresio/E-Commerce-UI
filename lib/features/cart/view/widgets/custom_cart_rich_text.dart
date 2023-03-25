import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';

class CustomCartRichText extends StatelessWidget {
  const CustomCartRichText(
      {super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColorsLight.kGreyColor,
          fontWeight: FontWeight.w400
        ),
        children: [
          TextSpan(
            text: label,
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                ),
          ),
        ],
      ),
    );
  }
}
