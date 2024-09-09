import 'package:flare/core/configs/assets/app_json_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

SnackBar appSnackBarSuccess({String? message, required BuildContext context}) {
  return SnackBar(
      backgroundColor: AppColors.green,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              message ?? "Success",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Lottie.asset(
            AppJsonAssets.success,
            height: 70,
            width: 70,
            fit: BoxFit.fill,
          ),
        ],
      ));
}
