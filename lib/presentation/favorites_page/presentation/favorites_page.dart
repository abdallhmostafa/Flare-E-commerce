import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentation/search/presentation/widgets/bloc_and_products_grid_view.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          title: "Favorites",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: Column(
          children: [
            Space.verticalSpace(30),
            const Expanded(
              child: Center(
                child: BlocAndProductsGridView(
                  isFavoritePage: true,
                ),
              ),
            ),
            Space.verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
