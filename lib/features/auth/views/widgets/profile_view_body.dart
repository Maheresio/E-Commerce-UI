import '../../../../core/utils/app_routes.dart';
import '../../manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Sign Out'),
          onPressed: () async {
            await authCubit.logout();
            if (context.mounted) {
              GoRouter.of(context).pushReplacement(AppRoutes.kAuthViewRoute);
            }
          },
        ),
      ),
    );
  }
}
