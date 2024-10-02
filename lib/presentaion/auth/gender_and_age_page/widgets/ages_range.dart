import 'package:flare/common/widgets/custom_loading/app_custom_loading.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/age_selection/ages_display_cubit.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/age_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesRange extends StatelessWidget {
  const AgesRange({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding / 2, vertical: 0),
      height: MediaQuery.of(context).size.height / 2.4,
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesDisplayLoadingState) {
            return const AppCustomLoading();
          } else if (state is AgesDisplaySuccessState) {
            return _successStateWidget(state);
          } else if (state is AgesDisplayFailureState) {
            return Center(
                child: Text(state.message,
                    style: Theme.of(context).textTheme.labelMedium));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  ListView _successStateWidget(AgesDisplaySuccessState state) {
    return ListView.builder(
      itemCount: state.ages.length,
      itemBuilder: (context, index) {
        return ListTile(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          title: Text(
            state.ages[index]['value'],
            style: Theme.of(context).textTheme.labelMedium,
          ),
          onTap: () {
            context.read<AgeSelectionCubit>().selectAgeRange(
                  state.ages[index]['value'],
                );
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
