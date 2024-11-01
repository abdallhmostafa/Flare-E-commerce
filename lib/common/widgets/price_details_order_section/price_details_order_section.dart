import 'package:flare/common/helpers/cart_helper.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';
import 'package:flare/presentation/cart/presentation/widgets/cart_with_items/coupon_code_widget.dart';
import 'package:flare/presentation/cart/presentation/widgets/cart_with_items/title_and_price_item.dart';
import 'package:flutter/material.dart';

class PriceDetailsSection extends StatelessWidget {
  const PriceDetailsSection(
      {super.key,
      required this.orderedProducts,
       this.isThereCouponCodeWidget =false});
  final List<ProductOrderedEntity> orderedProducts;
  final bool isThereCouponCodeWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Space.verticalSpace(12),
        TitleAndPriceItem(
            title: "Subtotal",
            price:
                "\$${CartHelper.calculateSubTotalPrice(orderedProducts).toStringAsFixed(0)}"),
        Space.verticalSpace(12),
        const TitleAndPriceItem(title: "Shipping Cost", price: "\$8.00"),
        Space.verticalSpace(12),
        const TitleAndPriceItem(title: "Tax", price: '\$0.00'),
        Space.verticalSpace(12),
        TitleAndPriceItem(
          title: "Total",
          price:
              "\$${CartHelper.calculateTotalPrice(orderedProducts).toStringAsFixed(0)}",
        ),
        Space.verticalSpace(10),
        isThereCouponCodeWidget
            ? const CouponCodeWidget()
            : const SizedBox.shrink(),
        Space.verticalSpace(10),
      ],
    );
  }
}
