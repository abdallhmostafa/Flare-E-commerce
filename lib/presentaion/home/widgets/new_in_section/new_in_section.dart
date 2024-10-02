import 'package:flare/app_service_locator.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/domain/product/use_cases/get_new_in_items_use_case.dart';
import 'package:flare/presentaion/home/widgets/bloc_and_product_item.dart';
import 'package:flare/presentaion/home/widgets/section_name_and_see_all.dart';
import 'package:flutter/material.dart';

class NewInSection extends StatelessWidget {
  const NewInSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionNameAndSeeAll(
          sectionName: 'New In',
          onTap: () {},
          color: AppColors.primary,
        ),
        Space.verticalSpace(24),
      BlocAndProductItem(
          useCase: AppServiceLocator.getIt<GetNewInItemsUseCase>(),
        ),
      ],
    );
  }
}
