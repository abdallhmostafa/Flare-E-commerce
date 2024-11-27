import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OrderDatailsTileItem extends StatelessWidget {
  const OrderDatailsTileItem({
    super.key,
     this.onTap,
    required this.title,
    this.deatils,
    required this.thereTrailing,
    required this.thereSubtitle,  this.thereLeading=true,
  });
  final String title;
  final String? deatils;
  final bool thereTrailing;
  final bool thereLeading;
  final bool thereSubtitle;
  final VoidCallback? onTap;
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
      leading: thereLeading? SvgPicture.asset(
        AppVectorsAssets.receipt,
        fit: BoxFit.fill,
        theme: const SvgTheme(currentColor: AppColors.white),
      ):null,
      subtitle: thereSubtitle
          ? Text(
              deatils ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            )
          : null,
      trailing: thereTrailing
          ? GestureDetector(
              onTap: onTap,
              child: Text(
                "View All",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            )
          : null,
      contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 12.w),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstant.radius8),
        ),
      ),
    );
  }
}
