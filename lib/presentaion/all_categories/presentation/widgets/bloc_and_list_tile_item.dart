import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentaion/all_categories/presentation/widgets/image_and_title_item.dart';
import 'package:flare/presentaion/all_categories/presentation/widgets/image_and_title_item_shimmer.dart';
import 'package:flare/presentaion/home/logic/get_gategories_info_cubit/get_gategories_info_cubit.dart';
import 'package:flare/presentaion/products_of_category/presentation/widgets/products_of_gateogry_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocAndListTileItem extends StatelessWidget {
  const BlocAndListTileItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetGategoriesCubit()..getCategories(),
      child: Expanded(
        child: BlocBuilder<GetGategoriesCubit, GetGategoriesState>(
          builder: (context, state) {
            if (state is GetGategoriesLoadingState) {
              return _loadingState();
            } else if (state is GetGategoriesSuccessState) {
              return _successState(state);
            } else {
              state as GetGategoriesFailureState;
              return Center(child: Text(state.failureMessage));
            }
          },
        ),
      ),
    );
  }

  ListView _loadingState() {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) => const ImageAndTitleItemShimmer());
  }

  ListView _successState(GetGategoriesSuccessState state) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: state.categories.length,
      itemBuilder: (context, index) => ImageAndTitleItem(
        networkImage: state.categories[index].image ?? '',
        title: state.categories[index].title ?? '',
        onTap: () {
          context.pushNamed(
            Routes.productsOfCategoryPage,
            argument: ProductsOfGateogryModel(
                categoryId: state.categories[index].categoryId,
                categoryTitle: state.categories[index].title ?? ''),
          );
        },
      ),
    );
  }
}
