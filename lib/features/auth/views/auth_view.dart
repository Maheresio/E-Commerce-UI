import 'package:flutter/material.dart';

import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
         resizeToAvoidBottomInset: false,
        body: AuthViewBody(),
      ),
    );
  }
}
