import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentaion/products_of_category/presentation/widgets/bloc_and_list_of_products.dart';
import 'package:flare/presentaion/products_of_category/presentation/widgets/products_of_gateogry_model.dart';
import 'package:flutter/material.dart';

class ProductsOfCategoryPage extends StatelessWidget {
  const ProductsOfCategoryPage({
    super.key,
    required this.productsOfGateogryModel,
  });
  final ProductsOfGateogryModel productsOfGateogryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppBar(),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.verticalSpace(16),
                Text(
                  style: Theme.of(context).textTheme.headlineMedium,
                  productsOfGateogryModel.categoryTitle,
                ),
                Space.verticalSpace(14),
              ],
            )),
            BlocAndListOfProducts(
                categoryId: productsOfGateogryModel.categoryId),
          ],
        ),
      ),
    );
  }
}
