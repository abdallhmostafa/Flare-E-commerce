import 'package:flare/app_service_locator.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/domain/product/use_cases/get_top_selling_items_use_case.dart';
import 'package:flare/presentaion/home/widgets/bloc_and_product_item.dart';
import 'package:flare/presentaion/home/widgets/section_name_and_see_all.dart';
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
        BlocAndProductItem(
          useCase: AppServiceLocator.getIt<GetTopSellingItemsUseCase>(),
        ),
      ],
    );
  }
}
