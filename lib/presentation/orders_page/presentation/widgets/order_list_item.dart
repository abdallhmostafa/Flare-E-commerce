import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderListItem extends StatelessWidget {
  const OrderListItem({
    super.key,
    required this.onTap,
    required this.title,
    required this.deatils,
  });
  final String title;
  final String deatils;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: AppColors.secondBackground,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      leading: SvgPicture.asset(
        AppVectorsAssets.receipt,
        fit: BoxFit.fill,
        theme: const SvgTheme(currentColor: AppColors.white),
      ),
      subtitle: Text(
        deatils,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: AppColors.white,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 12.w),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstant.radius8),
        ),
      ),
    );
  }
}
