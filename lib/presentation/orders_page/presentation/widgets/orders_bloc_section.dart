import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentation/orders_page/logic/cubit/get_ordered_products_cubit.dart';
import 'package:flare/presentation/orders_page/presentation/widgets/order_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersBlocSection extends StatelessWidget {
  const OrdersBlocSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderedProductsCubit, GetOrderedProductsState>(
      builder: (context, state) {
        if (state is GetOrderedProductsLoadingState) {
          return _loadingState();
        } else if (state is GetOrderedProductsFailureState) {
          return _failureState(state);
        } else if (state is GetOrderedProductsSuccessState) {
          return _successState(state);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Center _loadingState() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _failureState(GetOrderedProductsFailureState state) {
    return Center(
      child: Text(state.message),
    );
  }

  Expanded _successState(GetOrderedProductsSuccessState state) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => OrderListItem(
          title:
              "Order # ${(state.orderedProducts[index].createdAt).substring(20)}",
          onTap: () {
            context.pushNamed(Routes.orderedDetailsPage,
                argument: state.orderedProducts[index]);
          },
          deatils:
              "${state.orderedProducts[index].count} items, Total: \$${state.orderedProducts[index].totalPrice}",
        ),
        separatorBuilder: (context, index) => Space.verticalSpace(12),
        itemCount: state.orderedProducts.length,
      ),
    );
  }
}
