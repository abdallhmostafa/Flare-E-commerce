import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBasicButton extends StatelessWidget {
  const AppBasicButton(
      {super.key,
      this.text,
      required this.onPressed,
      this.backgroundColor,
      this.haveChild = false,
      this.child});
  final String? text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final bool haveChild;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 16, horizontal: 24),
      ),
      child: haveChild
          ? child
          : Text(
              text ?? "Continue",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: AppColors.white),
            ),
    );
  }
}
