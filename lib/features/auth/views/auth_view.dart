import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/service_locator.dart';
import '../manager/auth_cubit.dart';
import '../repos/auth_repo_imp.dart';
import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
            create: (context) => AuthCubit(authRepo: getIt.get<AuthRepoImp>()),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: AuthViewBody(),
      ),
    );
  }
}
