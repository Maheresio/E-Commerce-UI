import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_elevated_button.dart';
import '../../../core/widgets/custom_text_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/text_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/enums.dart';
import '../../../core/widgets/custom_text.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key});

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _nameController = TextEditingController();
var _authType = AuthFormType.login;

class _AuthViewBodyState extends State<AuthViewBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
                  _authType == AuthFormType.login
                      ? AppStrings.login
                      : AppStrings.signup,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 73.h,
                ),
                if (_authType == AuthFormType.register)
                  CustomTextFormField(
                    controller: _nameController,
                    hintText: AppStrings.enterYourName,
                    label: AppStrings.name,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    validator: (val) {
                      return null;
                    },
                  ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  label: AppStrings.email,
                  hintText: AppStrings.enterYourEmail,
                  validator: (val) =>
                      val!.isEmpty ? 'enter your email, please' : null,
                  textInputType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  label: AppStrings.password,
                  hintText: AppStrings.enterYourPassword,
                  validator: (val) =>
                      val!.isEmpty ? 'enter your password, please' : null,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                ),
                if (_authType == AuthFormType.login)
                  CustomTextButton(
                      text: AppStrings.forgotPassword, onPressed: () {}),
                SizedBox(
                  height: _authType == AuthFormType.login ? 20.h : 40.h,
                ),
                CustomElevatedButton(
                  formKey: _formKey,
                  text: _authType == AuthFormType.login
                      ? AppStrings.login.toUpperCase()
                      : AppStrings.signup.toUpperCase(),
                  onPressed: () {},
                ),
                CustomTextButton(
                  text: _authType == AuthFormType.login
                      ? AppStrings.dontHaveAccount
                      : AppStrings.haveAccount,
                  onPressed: () {
                    setState(() {
                      if (_authType == AuthFormType.login) {
                        _authType = AuthFormType.register;
                      } else {
                        _authType = AuthFormType.login;
                      }
                    });
                  },
                ),
                const Spacer(),
                Center(
                  child: CustomText(
                    text: _authType == AuthFormType.login
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
