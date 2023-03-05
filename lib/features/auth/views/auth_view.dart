import 'package:flutter/material.dart';

import 'auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
       resizeToAvoidBottomInset: false,
      body: AuthViewBody(),
    );
  }
}