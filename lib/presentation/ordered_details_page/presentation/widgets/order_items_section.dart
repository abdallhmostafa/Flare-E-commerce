import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/domain/order/entities/ordered_products_entity.dart';
import 'package:flare/presentation/ordered_details_page/presentation/widgets/order_datails_tile_item.dart';
import 'package:flutter/material.dart';

class OrderItemsSection extends StatelessWidget {
  const OrderItemsSection({super.key, required this.orderedProducts});
  final OrderedProductsEntity orderedProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Order Items",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Space.verticalSpace(16),
        OrderDatailsTileItem(
          onTap: () {
            context.pushNamed(Routes.orderedItemsPage,
            argument: orderedProducts.orderedProducts);
          },
          title: "${orderedProducts.count} Items",
          thereSubtitle: false,
          thereTrailing: true,
        ),
      ],
    );
  }
}
