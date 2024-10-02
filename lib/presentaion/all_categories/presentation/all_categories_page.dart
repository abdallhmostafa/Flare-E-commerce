import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentaion/all_categories/presentation/widgets/bloc_and_list_tile_item.dart';
import 'package:flutter/material.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.verticalSpace(16),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalScreenPadding,
            ),
            child: Text(
              'Shop by Categories',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Space.verticalSpace(14),
          const BlocAndListTileItem(),
        ],
      ),
    );
  }
}
