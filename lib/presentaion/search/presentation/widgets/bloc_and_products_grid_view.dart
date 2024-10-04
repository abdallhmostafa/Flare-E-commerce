import 'package:flare/presentaion/home/logic/product_cubit/get_product_cubit.dart';
import 'package:flare/presentaion/home/widgets/product_shimmer.dart';
import 'package:flare/presentaion/home/widgets/top_selling_section/product_item.dart';
import 'package:flare/presentaion/search/presentation/widgets/product_not_founded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlocAndProductsGridView extends StatelessWidget {
  const BlocAndProductsGridView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        if (state is GetProductLoadingState) {
          return _loadingState();
        } else if (state is GetProductSuccessState) {
          return _successState(state);
        } else if (state is GetProductFailureState) {
          return _failureState(state, context);
        } else {
          return Text(
            'Search for products',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }
      },
    );
  }
}

Widget _failureState(GetProductFailureState state, BuildContext context) {
  return Text(
    state.failureMessage,
    style: Theme.of(context).textTheme.labelMedium,
  );
}

Widget _successState(GetProductSuccessState state) {
  return state.products.isEmpty
      ? const ProductNotFounded()
      : CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          
          slivers: [
              SliverGrid.builder(
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 20.h,
                  mainAxisExtent: 300.h,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        left: index.isEven ? 0 : 6.w,
                        right: index.isEven ? 6.w : 0),
                    child: ProductItem(
                        isThereLeftMargin: false,
                        networkImage: state.products[index].images[1],
                        productName: state.products[index].title,
                        price: state.products[index].price.toString(),
                        deccoutPrice:
                            state.products[index].discountedPrice.toString()),
                  );
                },
              ),
            ]);
}

CustomScrollView _loadingState() {
  return CustomScrollView(
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    physics: const AlwaysScrollableScrollPhysics(),
    slivers: [
      SliverGrid.builder(
        itemCount: 6,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 20.h,
          mainAxisExtent: 300.h,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return const ProductShimmer();
        },
      ),
    ],
  );
}
