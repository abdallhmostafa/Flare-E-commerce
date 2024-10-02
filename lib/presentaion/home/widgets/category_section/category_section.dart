import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentaion/home/logic/get_gategories_info_cubit/get_gategories_info_cubit.dart';
import 'package:flare/presentaion/home/widgets/category_section/category_item.dart';
import 'package:flare/presentaion/home/widgets/category_section/shimmer_categorty_section.dart';
import 'package:flare/presentaion/home/widgets/section_name_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetGategoriesCubit()..getCategories(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SectionNameAndSeeAll(
            sectionName: 'Categories',
            onTap: () {
              context.pushNamed(Routes.allCategoriesPage);
            },
          ),
          Space.verticalSpace(14),
          SizedBox(
            height: 100.h,
            child: Builder(builder: (context) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: context.read<GetGategoriesCubit>().getlength(),
                itemBuilder: (context, index) {
                  return BlocBuilder<GetGategoriesCubit, GetGategoriesState>(
                    builder: (context, state) {
                      if (state is GetGategoriesLoadingState) {
                        return const ShimmerCategortySection();
                      }
                      if (state is GetGategoriesSuccessState) {
                        return _successState(state, index);
                      } else {
                        state as GetGategoriesFailureState;
                        return _failureState(state, context);
                      }
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Center _failureState(GetGategoriesFailureState state, BuildContext context) {
    return Center(
      child: Text(
        state.failureMessage,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }

  CategoryItem _successState(GetGategoriesSuccessState state, int index) {
    return CategoryItem(
      title: state.categories[index].title,
      networkImage: state.categories[index].image,
    );
  }
}
