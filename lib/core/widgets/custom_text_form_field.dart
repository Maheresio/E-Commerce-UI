import '../global/themes/app_colors/app_colors_light.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.validator,
      this.textInputType,
      this.textInputAction,
      this.floatingLabelBehavior,
      required this.label,
      required this.hintText, this.obscureText=false,  this.obscuringCharacter='*'});

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String label;
  final String hintText;
  final bool  obscureText;
  final String obscuringCharacter;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: TextFormField(
        controller: controller,
        validator: validator,
        enableInteractiveSelection: true,
        keyboardType: textInputType,
        textInputAction: textInputAction,
        obscureText: obscureText,
        obscuringCharacter: obscuringCharacter,
      
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: InputBorder.none,
          floatingLabelBehavior: floatingLabelBehavior,
          label: Text(label),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColorsLight.kGreyColor,
              ),
        ),
      ),
    );
  }
}
