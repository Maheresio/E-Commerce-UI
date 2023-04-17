import 'package:e_commerce_app/features/home/manager/sale_products_cubit/sale_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SaleProductsCubit>(
      create: (context) => SaleProductsCubit()..getSaleProducts(),
      child: const HomeViewBody(),
    );
  }
}
