import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/presentaion/auth/sign_in/logic/cubit/sing_in_cubit.dart';
import 'package:flare/presentaion/auth/sign_in/page/widgets/email_field_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppBar(
          hideBackArrorw: true,
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.horizontalScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space.verticalSpace(60),
              Text(
                "Sign In",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Space.verticalSpace(32),
              const EmailFieldSection(),
              Space.verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: AppBasicButton(
                      onPressed: () {
                        context.read<SingInCubit>().checkEmail(context);
                      },
                    ),
                  ),
                ],
              ),
              Space.verticalSpace(16),
              _forgotPassowrord(context),
              Space.verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }

  RichText _forgotPassowrord(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Dont have an Account ? ",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextSpan(
            text: " Create One",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUpPage);
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
}
