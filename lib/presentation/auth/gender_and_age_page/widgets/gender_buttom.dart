import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class GenderButtom extends StatelessWidget {
  const GenderButtom(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isSelected});
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: !isSelected ? AppColors.secondBackground : null,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium,
        ));
  }
}
