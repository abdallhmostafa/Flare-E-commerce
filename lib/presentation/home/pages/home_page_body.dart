import 'package:flutter/material.dart';
import 'package:flare/common/get_product_cubit/get_product_cubit.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentation/home/logic/get_gategories_info_cubit/get_gategories_info_cubit.dart';
import 'package:flare/presentation/home/logic/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:flare/presentation/home/widgets/category_section/category_section.dart';
import 'package:flare/presentation/home/widgets/header_section/header_section.dart';
import 'package:flare/presentation/home/widgets/new_in_section/new_in_section.dart';
import 'package:flare/presentation/home/widgets/top_selling_section/top_selling_section.dart';
import 'package:flare/presentation/home/widgets/search_field_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator.adaptive(
        onRefresh: () async {
          context.read<GetUserInfoCubit>().getUserInfo();
          context.read<GetGategoriesCubit>().getCategories();
          context.read<GetProductCubit>().getProducts();
        },
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Space.verticalSpace(8),
                  const HeaderSection(),
                  Space.verticalSpace(24),
                  GestureDetector(
                      onTap: () => context.pushNamed(Routes.searchPage),
                      child: const SearchFieldSection(enabled: false)),
                  Space.verticalSpace(24),
                  const CategorySection(),
                  const TopSellingSection(),
                  Space.verticalSpace(24),
                  const NewInSection(),
                  Space.verticalSpace(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
