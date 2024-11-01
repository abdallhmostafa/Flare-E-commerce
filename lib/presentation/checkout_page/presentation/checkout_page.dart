import 'package:flare/common/helpers/cart_helper.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/common/widgets/price_details_order_section/price_details_order_section.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';
import 'package:flare/presentation/checkout_page/presentation/widgets/checkout_list_tile_item.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.orderedProducts});
  final List<ProductOrderedEntity> orderedProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          title: "Checkout",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Space.verticalSpace(30),
                CheckoutListTileItem(
                  title: "Shipping Address",
                  description: "Add Shipping Address",
                  onTap: () {
                    // context.pushNamed(Routes.deliveryAddressPage);
                  },
                ),
                Space.verticalSpace(16),
                CheckoutListTileItem(
                  title: "Payment Method",
                  description: "Add Payment Method",
                  onTap: () {
                    // context.pushNamed(Routes.deliveryAddressPage);
                  },
                ),
              ],
            )),
            PriceDetailsSection(
              orderedProducts: orderedProducts,
            ),
            Space.verticalSpace(20),
            SizedBox(
              width: double.infinity,
              child: AppBasicButton(
                  haveChild: true,
                  onPressed: () {
                    context.pushNamed(
                      Routes.orderPlacedPage,
                    );
                  },
                  text: 'Checkout',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${CartHelper.calculateTotalPrice(orderedProducts).toStringAsFixed(0)}",
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Place Order",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: AppColors.white),
                      )
                    ],
                  )),
            ),
            Space.verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
