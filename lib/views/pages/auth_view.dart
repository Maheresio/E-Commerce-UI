import 'package:e_commerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/enums.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

final _formKey = GlobalKey<FormState>();
final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _nameController = TextEditingController();
var _authType = AuthFormType.login;

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsetsDirectional.only(
              start: screenWidth * .04,
              end: screenWidth * .04,
              top: screenHeight * .05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _authType == AuthFormType.login ? 'Login' : 'Sign up',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.kBlackColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(
                  height: screenHeight * .08,
                ),
                if (_authType == AuthFormType.register)
                  Material(
                    elevation: .2,
                    child: Container(
                      height: screenHeight * .08,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: constraints.maxHeight * .25),
                            child: TextFormField(
                              controller: _nameController,
                              enableInteractiveSelection: true,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                suffix: const Icon(
                                  Icons.check,
                                  color: AppColors.kSuccessColor,
                                ),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                label: const Text('Name'),
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppColors.kGreyTextColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Enter your Name',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppColors.kGreyTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                SizedBox(
                  height: screenHeight * .015,
                ),
                Material(
                  elevation: .2,
                  child: Container(
                    height: screenHeight * .08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: LayoutBuilder(builder: (context, constraints) {
                      return Center(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: constraints.maxHeight * .25),
                          child: TextFormField(
                            controller: _emailController,
                            enableInteractiveSelection: true,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              suffix: const Icon(
                                Icons.check,
                                color: AppColors.kSuccessColor,
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: const Text('Email'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.kGreyTextColor,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Enter your email',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.kGreyTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .015,
                ),
                Material(
                  elevation: .2,
                  child: Container(
                    height: screenHeight * .08,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: _passwordController,
                        enableInteractiveSelection: true,
                        obscureText: true,
                        obscuringCharacter: '*',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          hintText: 'Password',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: AppColors.kGreyTextColor,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                if (_authType == AuthFormType.login)
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        'Forgot your password?',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.kBlackColor,
                            ),
                      ),
                    ),
                  ),
                SizedBox(
                  height: screenHeight * .05,
                ),
                SizedBox(
                  width: double.infinity,
                  height: screenHeight * .07,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                        _authType == AuthFormType.login ? 'LOGIN' : 'SIGN UP'),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (_authType == AuthFormType.login) {
                          _authType = AuthFormType.register;
                        } else {
                          _authType = AuthFormType.login;
                        }
                      });
                    },
                    child: Text(
                      _authType == AuthFormType.login
                          ? 'Don\'t have an account? Register'
                          : 'Have an account? Login',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.kBlackColor,
                          ),
                    ),
                  ),
                ),
                const Spacer(),
                Center(
                  child: Text(
                    _authType == AuthFormType.login
                        ? 'Or login with social account'
                        : 'Or sign up with social account',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.kBlackColor,
                        ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      elevation: 15,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        height: screenHeight * .08,
                        width: screenWidth * .22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white,
                        ),
                        child: Icon(FontAwesomeIcons.google,
                            color: AppColors.kPrimaryColor),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * .05,
                    ),
                    Material(
                      elevation: 15,
                      borderRadius: BorderRadius.circular(24),
                      child: Container(
                        height: screenHeight * .08,
                        width: screenWidth * .22,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: Colors.white,
                        ),
                        child: Icon(FontAwesomeIcons.squareFacebook,
                            color: AppColors.kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * .05,
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
