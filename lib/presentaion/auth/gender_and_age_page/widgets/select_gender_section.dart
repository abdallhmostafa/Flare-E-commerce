import 'package:flare/common/helpers/space.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/widgets/gender_buttom.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectGenderSection extends StatelessWidget {
  const SelectGenderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Who do you shop for ?",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Space.verticalSpace(20),
        BlocBuilder<GenderSelectionCubit, int>(
          builder: (context, state) {
            final GenderSelectionCubit genderCubit =
                context.read<GenderSelectionCubit>();
        
            return Row(
              children: [
                Expanded(
                  child: GenderButtom(
                    onPressed: () {
                      genderCubit.selectGender(index: 1);
                    },
                    isSelected: state == 1,
                    text: "Men",
                  ),
                ),
                Space.horizotalSpace(20),
                Expanded(
                  child: GenderButtom(
                    onPressed: () {
                      context
                          .read<GenderSelectionCubit>()
                          .selectGender(index: 2);
                    },
                    isSelected: state == 2,
                    text: "Women",
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
