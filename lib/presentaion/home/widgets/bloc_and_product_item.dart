import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/presentaion/home/logic/product_cubit/get_product_cubit.dart';
import 'package:flare/presentaion/home/widgets/product_shimmer.dart';
import 'package:flare/presentaion/home/widgets/top_selling_section/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocAndProductItem extends StatelessWidget {
  const BlocAndProductItem({super.key, required this.useCase});
  final UseCase useCase;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetProductCubit(useCase: useCase)..getProducts(),
      child: SizedBox(
        height: 300.h,
        child: BlocBuilder<GetProductCubit, GetProductState>(
          builder: (context, state) {
            if (state is GetProductLoadingState) {
              return _loadingState();
            } else if (state is GetProductSuccessState) {
              return _successState(state);
            } else {
              state as GetProductFailureState;
              return _failureState(state);
            }
          },
        ),
      ),
    );
  }
}

Center _failureState(GetProductFailureState state) {
  return Center(
    child: Text(state.failureMessage),
  );
}

ListView _successState(GetProductSuccessState state) {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.zero,
    physics: const AlwaysScrollableScrollPhysics(),
    itemCount: state.products.length,
    itemBuilder: (context, index) {
      final product = state.products[index];
      return ProductItem(
        networkImage: product.images[2],
        productName: product.title,
        deccoutPrice: product.discountedPrice.toString(),
        price: product.price.toString(),
      );
    },
  );
}

ListView _loadingState() {
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.zero,
    physics: const AlwaysScrollableScrollPhysics(),
    itemCount: 5,
    itemBuilder: (context, index) {
      return const ProductShimmer();
    },
  );
}
