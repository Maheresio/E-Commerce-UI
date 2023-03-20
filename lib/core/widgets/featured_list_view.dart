import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../global/themes/app_colors/app_colors_light.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
    required this.listView,
  });

  final String title;
  final String subtitle;
  final void Function()? onPressed;
  final Widget listView;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: 10.w,
              ),
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColorsLight.kBlackColor,
                      ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 4.h,
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColorsLight.kGreyColor,
              ),
        ),
        SizedBox(
          height: 22.h,
        ),
        listView,
      ],
    );
  }
}
