import 'package:flare/common/widgets/custom_error/app_snack_bar_error.dart';
import 'package:flare/presentation/cart/logic/cubit/get_ordered_products_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetOrderedProductsCartBlocListner extends StatelessWidget {
  const GetOrderedProductsCartBlocListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetOrderedProductsCartCubit,
        GetOrderedProductsCartState>(
      listener: (context, state) {
        if (state is GetOrderedProductsCartFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            appSnackBarError(
                context: context, errorMessge: state.failureMessage),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
