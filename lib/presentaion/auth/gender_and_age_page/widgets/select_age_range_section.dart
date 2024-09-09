import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/common/helpers/app_bottom_sheet.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/age_selection/ages_display_cubit.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/widgets/ages_range.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/age_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectAgeRangeSection extends StatelessWidget {
  const SelectAgeRangeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "How old are you ?",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Space.verticalSpace(15),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  AppBottomSheet.showBottomSheet(
                    context,
                    MultiBlocProvider(
                      providers: [
                        BlocProvider<AgeSelectionCubit>.value(
                          value: context.read<AgeSelectionCubit>(),
                        ),
                        BlocProvider<AgesDisplayCubit>.value(
                          value: context.read<AgesDisplayCubit>()
                            ..displayAges(),
                        ),
                      ],
                      child: const AgesRange(),
                    ),
                  );
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: const BoxDecoration(
                    color: AppColors.secondBackground,
                    borderRadius: BorderRadius.all(Radius.circular(55)),
                  ),
                  child: BlocBuilder<AgeSelectionCubit, String>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(state,
                              style: Theme.of(context).textTheme.labelMedium),
                          const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}