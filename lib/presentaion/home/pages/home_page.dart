import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentaion/home/widgets/category_section/category_section.dart';
import 'package:flare/presentaion/home/widgets/header_section/header_section.dart';
import 'package:flare/presentaion/home/widgets/new_in_section/new_in_section.dart';
import 'package:flare/presentaion/home/widgets/top_selling_section/top_selling_section.dart';
import 'package:flare/presentaion/home/widgets/search_field_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalScreenPadding,
          ),
          child: CustomScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const HeaderSection(),
                    Space.verticalSpace(24),
                    const SearchFieldSection(),
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
      ),
    );
  }
}
