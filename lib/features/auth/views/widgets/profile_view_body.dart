import '../../../../core/global/themes/app_colors/app_colors_light.dart';
import '../../../../core/utils/app_strings.dart';
import 'custom_profile_list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final user = BlocProvider.of<AuthCubit>(context).getCurrentUser();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              AppStrings.myProfile,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: const NetworkImage(
                      'https://joyfullystyled.com/wp-content/uploads/2020/02/pink-hat.jpg'),
                  radius: 35.w,
                ),
                SizedBox(
                  width: 18.w,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(top: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? '',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Text(
                        user?.email ?? '',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColorsLight.kGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            const CustomProfileListView(),
            CustomElevatedButton(
              text: AppStrings.signOut,
              onPressed: () async {
                await authCubit.logout();
                if (context.mounted) {
                  GoRouter.of(context)
                      .pushReplacement(AppRoutes.kAuthViewRoute);
                }
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
