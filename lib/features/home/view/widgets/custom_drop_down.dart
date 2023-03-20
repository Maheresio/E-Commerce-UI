import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        shape: BoxShape.rectangle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Size', style: Theme.of(context).textTheme.bodyLarge),
            const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }
}
