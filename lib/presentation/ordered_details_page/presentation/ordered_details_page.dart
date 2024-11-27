import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/domain/order/entities/ordered_products_entity.dart';
import 'package:flare/presentation/ordered_details_page/presentation/widgets/order_items_section.dart';
import 'package:flare/presentation/ordered_details_page/presentation/widgets/order_time_line_section.dart';
import 'package:flare/presentation/ordered_details_page/presentation/widgets/shipping_details_section.dart';
import 'package:flutter/material.dart';

class OrderedDetailsPage extends StatelessWidget {
  const OrderedDetailsPage({super.key, required this.orderedProducts});
  final OrderedProductsEntity orderedProducts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          title: "Order # ${(orderedProducts.createdAt).substring(20)}",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: Column(
          children: [
            Space.verticalSpace(30),
            OrderTimeLineSection(
              date: orderedProducts.createdAt.substring(0, 10),
            ),
            Space.verticalSpace(40),
            OrderItemsSection(orderedProducts: orderedProducts),
            Space.verticalSpace(40),
            ShippingDetailsSection(
              deliveryAddressModel: orderedProducts.deliveryAddress,
            ),
          ],
        ),
      ),
    );
  }
}
