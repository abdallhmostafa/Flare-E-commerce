import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key, required this.onTap, required this.description});
  final String description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: AppColors.secondBackground,
      title: Text(
        description,
        style: Theme.of(context).textTheme.labelMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.white,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppConstant.radius8)),
      ),
    );
  }
}
