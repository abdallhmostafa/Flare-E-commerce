import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ForgetPasswordSection extends StatelessWidget {
  const ForgetPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Forgot Password ?",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextSpan(
            text: " Reset",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(
                  Routes.forgetPasswordPage,
                );
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
