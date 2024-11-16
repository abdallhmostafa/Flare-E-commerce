import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalScreenPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppVectorsAssets.emailSending),
              Space.verticalSpace(24),
              Text(
                'We Sent you an Email to reset your password.',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              Space.verticalSpace(24),
              AppBasicButton(
                  text: "Return to Login",
                  onPressed: () {
                    context.pushReplacementNamed(Routes.signInPage);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
