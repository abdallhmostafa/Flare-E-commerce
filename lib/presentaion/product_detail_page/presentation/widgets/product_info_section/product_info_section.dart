import 'package:flare/common/helpers/space.dart';
import 'package:flutter/material.dart';

class ProductInfoSection extends StatelessWidget {
  const ProductInfoSection({super.key});
  final String info =
      "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
              ),
        ),
        Space.verticalSpace(24),
        Text(
          "Shipping & Returns",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Space.verticalSpace(12),
        Text(
          "Free standard shipping and free 60-day returns",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
              ),
        ),
      ],
    );
  }
}
