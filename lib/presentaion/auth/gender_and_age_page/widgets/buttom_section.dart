import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/widgets/button/app_basic_reactive_button.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/data/auth/models/user_creation_request.dart';
import 'package:flare/domain/auth/usecase/sign_up_use_case.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/age_selection_cubit.dart';
import 'package:flare/presentaion/auth/gender_and_age_page/logic/gender_selection_cubit.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_reactive_submit_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtomSection extends StatelessWidget {
  const ButtomSection({
    super.key,
    required this.userCreationRequest,
  });

  final UserCreationRequest userCreationRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: AppColors.secondBackground,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.horizontalScreenPadding),
              child: AppBasicReactiveButton(
                  onPressed: () {
                    final AgeSelectionCubit ageCubit =
                        context.read<AgeSelectionCubit>();
                    if (ageCubit.selectAge != '') {
                      userCreationRequest.age = ageCubit.selectAge;
                      userCreationRequest.gender =
                          context.read<GenderSelectionCubit>().selectedGender;

                      ageCubit.selectAge;
                      context.read<AppBasicReactiveButtonCubit>().submit(
                            useCase: SignUpUseCase(),
                            params: userCreationRequest,
                          );
                    }
                  },
                  text: "Finish"),
            ),
          ),
          AppReactiveSubmitBlocListner(
            successMessage: "Congratulations! You have successfully signed up.\nLet's go to the sign in page",
            forSuccessState: () {
              context.pushNamedAndRemoveUntil(
                Routes.signInPage,
                predicate: (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
