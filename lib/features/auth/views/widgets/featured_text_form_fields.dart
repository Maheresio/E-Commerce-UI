import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/features/auth/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class FeaturedTextFormFields extends StatelessWidget {
  const FeaturedTextFormFields(
      {super.key,
      required this.authFormType,
      required this.nameController,
      required this.emailController,
      required this.passwordController});

  final AuthFormType authFormType;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final authCubit =BlocProvider.of<AuthCubit>(context);
    return Column(
      children: [
        if (authFormType == AuthFormType.register)
          CustomTextFormField(
            onChanged:authCubit.updateName ,
            controller: nameController,
            hintText: AppStrings.enterYourName,
            label: AppStrings.name,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.name,
            validator: (val) => val!.isEmpty ? 'enter your name, please' : null,
          ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextFormField(
          onChanged: authCubit.updateEmail,
          controller: emailController,
          label: AppStrings.email,
          hintText: AppStrings.enterYourEmail,
          validator: (val) => val!.isEmpty ? 'enter your email, please' : null,
          textInputType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        SizedBox(
          height: 8.h,
        ),
        CustomTextFormField(
          onChanged: authCubit.updatePassword,
          controller: passwordController,
          label: AppStrings.password,
          hintText: AppStrings.enterYourPassword,
          validator: (val) =>
              val!.isEmpty ? 'enter your password, please' : null,
          obscureText: true,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
