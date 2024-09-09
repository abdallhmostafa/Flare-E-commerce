import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/common/widgets/text_field/app_text_form_field.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: BasicAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.defaultScreenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                "Forgot Password",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Space.verticalSpace(32),
              const AppTextFormField(
                hintText: 'Enter Email address',
                textInputAction: TextInputAction.done,
              ),
              Space.verticalSpace(16),
              Row(
                children: [
                  Expanded(
                    child: AppBasicButton(
                      onPressed: () {
                        // context.pushNamed(Routes.enterPasswordPage);
                      },
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 8),
            ],
          ),
        ),
      ),
    );
  }
}
