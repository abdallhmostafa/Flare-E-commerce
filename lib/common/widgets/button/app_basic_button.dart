import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBasicButton extends StatelessWidget {
  const AppBasicButton(
      {super.key, this.text, required this.onPressed, this.backgroundColor});
  final String? text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: 0,
        padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
      ),
      child: Text(
        text ?? "Continue",
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: AppColors.wight),
      ),
    );
  }
}
