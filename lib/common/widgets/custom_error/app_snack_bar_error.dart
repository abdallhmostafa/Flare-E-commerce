import 'package:flare/core/configs/assets/app_json_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

SnackBar appSnackBarError(
    {String? errorMessge, required BuildContext context}) {
  return SnackBar(
      backgroundColor: AppColors.red,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              errorMessge ?? "Something went wrong",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Lottie.asset(
            AppJsonAssets.error,
            height: 70,
            width: 70,
            fit: BoxFit.fill,
          ),
        ],
      ));
}
