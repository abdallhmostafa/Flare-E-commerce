import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/product/use_cases/get_products_by_category_id.dart';
import 'package:flare/presentaion/home/logic/product_cubit/get_product_cubit.dart';
import 'package:flare/presentaion/home/widgets/product_shimmer.dart';
import 'package:flare/presentaion/home/widgets/top_selling_section/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocAndListOfProducts extends StatelessWidget {
  const BlocAndListOfProducts({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetProductCubit(
          useCase: AppServiceLocator.getIt<GetProductsByCategoryIdUseCase>())
        ..getProducts(params: categoryId),
      child: BlocBuilder<GetProductCubit, GetProductState>(
        builder: (context, state) {
          if (state is GetProductLoadingState) {
            return _loadingState();
          } else if (state is GetProductSuccessState) {
            return _successState(state);
          } else {
            state as GetProductFailureState;
            return _failureState(state, context);
          }
        },
      ),
    );
  }

  Center _failureState(GetProductFailureState state, BuildContext context) {
    return Center(
      child: Text(
        state.failureMessage,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  SliverGrid _successState(GetProductSuccessState state) {
    return SliverGrid.builder(
      itemCount: state.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20.h,
        mainAxisExtent: 300.h,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
            networkImage: state.products[index].images[1],
            productName: state.products[index].title,
            price: state.products[index].price.toString(),
            deccoutPrice: state.products[index].discountedPrice.toString());
      },
    );
  }

  SliverGrid _loadingState() {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20.h,
        mainAxisExtent: 300.h,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return const ProductShimmer();
      },
    );
  }
}
