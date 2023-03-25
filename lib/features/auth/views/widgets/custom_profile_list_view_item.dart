import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';

class CustomProfileListViewItem extends StatelessWidget {
  const CustomProfileListViewItem(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColorsLight.kGreyColor,
            ),
      ),
      trailing: const Icon(
        Icons.keyboard_arrow_right,
        color: AppColorsLight.kGreyColor,
      ),
    );
  }
}
