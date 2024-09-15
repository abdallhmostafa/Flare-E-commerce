import 'dart:developer';

import 'package:flare/common/helpers/space.dart';
import 'package:flare/presentaion/home/logic/get_gategories_info_cubit/get_gategories_info_cubit.dart';
import 'package:flare/presentaion/home/widgets/category_section/category_item.dart';
import 'package:flare/presentaion/home/widgets/category_section/shimmer_categorty_section.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              InkWell(
                onTap: () {},
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  child: Text(
                    'See All',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              )
            ],
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
                        log("The Success is executed");
                        return CategoryItem(
                          title: state.categories[index].title,
                          networkImage: state.categories[index].image,
                        );
                      } else {
                        state as GetGategoriesFailureState;
                        return Center(
                          child: Text(
                            state.failureMessage,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        );
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
}
