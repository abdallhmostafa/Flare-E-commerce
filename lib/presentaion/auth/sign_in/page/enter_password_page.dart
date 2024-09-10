import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_reactive_submit_bloc_listner.dart';
import 'package:flare/common/widgets/button/app_basic_reactive_button.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/data/auth/models/user_sign_in_request.dart';
import 'package:flare/domain/auth/usecase/sign_in_use_case.dart';
import 'package:flare/presentaion/auth/sign_in/logic/cubit/sing_in_cubit.dart';
import 'package:flare/presentaion/auth/sign_in/page/widgets/forget_password_section.dart';
import 'package:flare/presentaion/auth/sign_in/page/widgets/password_field_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EnterPasswordPage extends StatelessWidget {
  const EnterPasswordPage({super.key, required this.userSignInRequest});
  final UserSignInRequest userSignInRequest;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppBar(),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.verticalSpace(60),
              Text(
                "Sign In",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Space.verticalSpace(32),
              const PasswordFieldSection(),
              Space.verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: AppBasicReactiveButton(
                      onPressed: () {
                        if (context.read<SingInCubit>().checkPassword(
                            userSignInRequest: userSignInRequest)) {
                          context.read<AppBasicReactiveButtonCubit>().submit(
                                useCase: SignInUseCase(),
                                params: userSignInRequest,
                              );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Space.verticalSpace(16),
              const ForgetPasswordSection(),
              Space.verticalSpace(20),
              AppReactiveSubmitBlocListner(
                successMessage:
                    "Congratulations!🎉🥳, You have sign in successfully",
                forSuccessState: () {
                  context.pushNamedAndRemoveUntil(Routes.homePage,
                      predicate: (route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
