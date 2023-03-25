import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const CartListViewItem(),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          height: 8.h,
        ),
      ),
    );
  }
}
