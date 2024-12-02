import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/presentation/cart/logic/cubit/get_ordered_products_cart_cubit.dart';
import 'package:flare/presentation/cart/presentation/cart_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetOrderedProductsCartCubit()..getOrderedProducts(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: BlocBuilder<GetOrderedProductsCartCubit,
                GetOrderedProductsCartState>(
              builder: (context, state) {
                return BasicAppBar(
                  isCenterTitle: true,
                  hideBackArrorw: true,
                  title:
                      state is GetOrderedProductsCartSuccessState ? "Cart" : "",
                );
              },
            ),
          ),
          body: RefreshIndicator.adaptive(
              onRefresh: () async {
                context
                    .read<GetOrderedProductsCartCubit>()
                    .getOrderedProducts();
              },
              child: const CartPageBody()),
        );
      }),
    );
  }
}
