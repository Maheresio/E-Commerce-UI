import '../../../../core/utils/app_strings.dart';
import 'custom_profile_list_view_item.dart';
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
        itemCount: AppStrings.kProfileTitle.length,
      ),
    );
  }
}
