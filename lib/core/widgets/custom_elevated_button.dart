import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {super.key, required this.formKey, required this.text, required this.onPressed});

  final GlobalKey<FormState> formKey;
  final String text;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        onPressed:onPressed,
        child: Text(text),
      ),
    );
  }
}
