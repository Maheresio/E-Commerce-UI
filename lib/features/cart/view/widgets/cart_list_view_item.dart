import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/global/themes/app_colors/app_colors_light.dart';

class CartListViewItem extends StatelessWidget {
  const CartListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: 104.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FittedBox
              (
                  fit: BoxFit.fill,
                  child: Image.network(
                      'https://ae01.alicdn.com/kf/HTB1zsfoadfvK1RjSspfq6zzXFXa5/Vneck.jpg'),
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pull over',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Color: Black',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Text(
                              'Size: L',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: AppColorsLight.kGreyColor,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Card(
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                        const Text('1'),
                        Card(
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const Text('41'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
