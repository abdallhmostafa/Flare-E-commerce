import 'package:flare/presentation/cart/logic/cubit/get_ordered_products_cart_cubit.dart';
import 'package:flare/presentation/cart/presentation/widgets/cart_with_items/cart_with_items.dart';
import 'package:flare/presentation/cart/presentation/widgets/empty_cart.dart';
import 'package:flare/presentation/cart/presentation/widgets/get_ordered_products_cart_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageBody extends StatelessWidget {
  const CartPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<GetOrderedProductsCartCubit,
              GetOrderedProductsCartState>(
            builder: (context, state) {
              if (state is GetOrderedProductsCartLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetOrderedProductsCartSuccessState) {
                return state.orderedProducts.isEmpty
                    ? const EmptyCart()
                    : CartWithItems(orderedProducts: state.orderedProducts);
              } else if (state is GetOrderedProductsCartFailureState) {
                return Center(
                  child: Text(state.failureMessage),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
        const GetOrderedProductsCartBlocListner(),
      ],
    );
  }
}
