import 'package:flare/common/helpers/space.dart';
import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/presentation/ordered_details_page/presentation/widgets/order_datails_tile_item.dart';
import 'package:flutter/material.dart';

class ShippingDetailsSection extends StatelessWidget {
  const ShippingDetailsSection({super.key, required this.deliveryAddressModel});
  final DeliveryAddressModel deliveryAddressModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping details",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Space.verticalSpace(16),
        OrderDatailsTileItem(
          title:
              "${deliveryAddressModel.state.toUpperCase()}, ${deliveryAddressModel.city}",
          thereSubtitle: true,
          thereLeading: false,
          deatils:
              "${deliveryAddressModel.streetAddress}, ${deliveryAddressModel.zipCode}",
          thereTrailing: false,
        ),
      ],
    );
  }
}
