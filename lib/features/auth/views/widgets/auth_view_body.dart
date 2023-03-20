import 'package:e_commerce_app/core/global/themes/app_colors/app_colors_light.dart';
import 'package:e_commerce_app/core/helpers/custom_snack_bar.dart';
import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/features/auth/manager/auth_cubit.dart';
import 'package:e_commerce_app/features/auth/views/widgets/build_text_form_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../../../core/widgets/text_action_button.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            start: 14.w,
            end: 14.w,
            top: 80.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                authCubit.authFormType == AuthFormType.login
                    ? AppStrings.login
                    : AppStrings.signup,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(
                height: 73.h,
              ),
              BuildTextFormFields(
                authFormType: authCubit.authFormType,
                emailController: _emailController,
                nameController: _nameController,
                passwordController: _passwordController,
              ),
              if (authCubit.authFormType == AuthFormType.login)
                CustomTextButton(
                  text: AppStrings.forgotPassword,
                  onPressed: () {},
                ),
              if (authCubit.authFormType == AuthFormType.register)
                SizedBox(
                  height: 40.h,
                ),
              BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return Center(
                      child: LoadingAnimationWidget.discreteCircle(
                        color: AppColorsLight.kPrimaryColor,
                        size: 40.w,
                      ),
                    );
                  }
                  return CustomElevatedButton(
                    text: authCubit.authFormType == AuthFormType.login
                        ? AppStrings.login.toUpperCase()
                        : AppStrings.signup.toUpperCase(),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        await authCubit.submit();
                      }
                    },
                  );
                },
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    GoRouter.of(context)
                        .pushReplacement(AppRoutes.kNavBarViewRoute);
                  } else if (state is AuthFailure) {
                    customSnackBar(context, state.errorMsg);
                  }
                },
              ),
              CustomTextButton(
                text: authCubit.authFormType == AuthFormType.login
                    ? AppStrings.dontHaveAccount
                    : AppStrings.haveAccount,
                onPressed: () {
                  setState(() {
                    authCubit.copyWith(email: '', password: '', name: '');
                    _formKey.currentState!.reset();
                    FocusScope.of(context).unfocus();
                    authCubit.toggle();
                  });
                },
              ),
              const Spacer(),
              Center(
                child: CustomText(
                  text: authCubit.authFormType == AuthFormType.login
                      ? AppStrings.loginWithSocialAccount
                      : AppStrings.signupWithSocialAccount,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextActionButton(
                    icon: FontAwesomeIcons.google,
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  TextActionButton(
                    icon: FontAwesomeIcons.squareFacebook,
                    onPressed: () {},
                  )
                ],
              ),
              SizedBox(
                height: 57.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
