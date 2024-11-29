import 'package:flare/common/helpers/space.dart';
import 'package:flare/presentation/home/widgets/bloc_and_product_item.dart';
import 'package:flare/presentation/home/widgets/section_name_and_see_all.dart';
import 'package:flutter/material.dart';

class TopSellingSection extends StatelessWidget {
  const TopSellingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionNameAndSeeAll(
          sectionName: 'Top Selling',
          onTap: () {},
        ),
        Space.verticalSpace(24),
        const BlocAndProductItem(),
      ],
    );
  }
}
