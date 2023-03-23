import 'package:e_commerce_app/core/utils/app_strings.dart';
import 'package:e_commerce_app/features/auth/views/widgets/custom_profile_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomProfileListView extends StatelessWidget {
  const CustomProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => CustomProfileListViewItem(
          title: AppStrings.kProfileTitle.elementAt(index),
          subtitle: AppStrings.kProfileSubtitle.elementAt(index),
        ),
        itemCount: 6,
      ),
    );
  }
}
