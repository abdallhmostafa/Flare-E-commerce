import 'package:flare/app_service_locator.dart';
import 'package:flare/common/get_product_cubit/get_product_cubit.dart';
import 'package:flare/presentation/home/pages/home_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/product/use_cases/get_new_in_items_use_case.dart';
import '../../../domain/product/use_cases/get_top_selling_items_use_case.dart';
import '../logic/get_gategories_info_cubit/get_gategories_info_cubit.dart';
import '../logic/get_user_info_cubit/get_user_info_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GetProductCubit(
              useCase: AppServiceLocator.getIt<GetTopSellingItemsUseCase>())
            ..getProducts(),
        ),
        BlocProvider(
          create: (_) => GetProductCubit(
              useCase: AppServiceLocator.getIt<GetNewInItemsUseCase>())
            ..getProducts(),
        ),
        BlocProvider(
          create: (_) => GetGategoriesCubit()..getCategories(),
        ),
        BlocProvider(
          create: (_) => GetUserInfoCubit()..getUserInfo(),
        ),
      ],
      child: const HomePageBody(),
    );
  }
}
