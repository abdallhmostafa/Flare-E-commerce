import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentaion/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:flare/presentaion/auth/sign_up/pages/widgets/create_account_fields_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: BasicAppBar(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.defaultScreenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Space.verticalSpace(32),
                  const CreateAccountFieldsSection(),
                  Space.verticalSpace(40),
                  Row(
                    children: [
                      Expanded(child: AppBasicButton(
                        onPressed: () {
                          if (context
                              .read<SignUpCubit>()
                              .formKey
                              .currentState!
                              .validate()) {
                            context
                                .read<SignUpCubit>()
                                .checkIfAllFieldsAreFilled(context);
                          }
                        },
                      )),
                    ],
                  ),
                  Space.verticalSpace(16),
                  _haveAccount(context),
                  Space.verticalSpace(30),
                ],
              ),
            ),
          ),
        ));
  }
}

RichText _haveAccount(BuildContext context) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: "Have an Account ? ",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        TextSpan(
          text: " Sign In",
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              context.pushNamed(Routes.signInPage);
            },
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
