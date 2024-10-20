import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomSheet {
  AppBottomSheet._();
  static Future<void> showBottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      builder: (_) {
        return child;
      },
    );
  }
}
