import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/widgets/buttom_section.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/widgets/select_age_range_section.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/widgets/select_gender_section.dart';
import 'package:flutter/material.dart';

class GenderAndAgePage extends StatelessWidget {
  final UserCreationRequest userCreationRequest;
  const GenderAndAgePage({super.key, required this.userCreationRequest});

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
          Space.verticalSpace(60),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.horizontalScreenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tell us About Yourself",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Space.verticalSpace(30),
                const SelectGenderSection(),
                Space.verticalSpace(55),
                const SelectAgeRangeSection(),
              ],
            ),
          ),
          const Spacer(flex: 9),
          ButtomSection(userCreationRequest: userCreationRequest),
        ],
      ),
    );
  }
}
