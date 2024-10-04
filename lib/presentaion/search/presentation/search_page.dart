import 'package:flare/app_service_locator.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/domain/product/use_cases/get_products_by_title_use_case.dart';
import 'package:flare/presentaion/home/logic/product_cubit/get_product_cubit.dart';
import 'package:flare/presentaion/home/widgets/search_field_section.dart';
import 'package:flare/presentaion/search/presentation/widgets/bloc_and_products_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetProductCubit(
          useCase: AppServiceLocator.getIt<GetProductsByTitleUseCase>()),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h),
          child: BasicAppBar(
            titleWidget: Builder(builder: (context) {
              return SearchFieldSection(
                onChanged: (val) {
                  if (val.isEmpty) {
                    context.read<GetProductCubit>().clearProducts();
                  } else {
                    context.read<GetProductCubit>().getProducts(params: val);
                  }
                },
              );
            }),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalScreenPadding,
          ),
          child: const Center(child: BlocAndProductsGridView()),
        ),
      ),
    );
  }
}
