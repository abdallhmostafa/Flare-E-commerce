import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';
import 'package:flare/presentation/cart/logic/cubit/get_ordered_products_cart_cubit.dart';
import 'package:flare/presentation/cart/presentation/widgets/cart_with_items/cart_itme.dart';
import 'package:flare/common/widgets/price_details_order_section/price_details_order_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWithItems extends StatelessWidget {
  const CartWithItems({super.key, required this.orderedProducts});
  final List<ProductOrderedEntity> orderedProducts;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstant.horizontalScreenPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    context
                        .read<GetOrderedProductsCartCubit>()
                        .removeAllOrderedProduct(
                            orderedProducts: orderedProducts);
                  },
                  child: Text('Remove',
                      style: Theme.of(context).textTheme.labelMedium))
            ],
          ),
          Space.verticalSpace(8),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CartItme(
                id: orderedProducts[index].id,
                image: orderedProducts[index].productImage,
                title: orderedProducts[index].productTitle,
                size: orderedProducts[index].productSize,
                color: orderedProducts[index].productColor,
                price: "\$${orderedProducts[index].productPrice}",
              ),
              separatorBuilder: (context, index) => Space.verticalSpace(8),
              itemCount: orderedProducts.length,
            ),
          ),
          PriceDetailsSection(
            orderedProducts: orderedProducts,
          ),
          Space.verticalSpace(20),
          SizedBox(
              width: double.infinity,
              child: AppBasicButton(
                  onPressed: () {
                    context.pushNamed(Routes.checkoutPage,
                        argument: orderedProducts);
                  },
                  text: 'Checkout')),
          Space.verticalSpace(10),
        ],
      ),
    );
  }
}
