import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ImageAndTitleItemShimmer extends StatelessWidget {
  const ImageAndTitleItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.secondBackground,
      highlightColor: AppColors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        margin: EdgeInsets.only(
            bottom: 8.h,
            left: AppConstant.horizontalScreenPadding,
            right: AppConstant.horizontalScreenPadding),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(8.w),
          ),
        ),
        child: Row(
          children: [
            Shimmer.fromColors(
              baseColor: AppColors.primary,
              highlightColor: AppColors.white,
              child: Container(
                width: 40.w,
                height: 40.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondBackground,
                ),
              ),
            ),
            Space.horizotalSpace(10),
            Container(
              width: 60.w,
              height: 15.h,
              color: AppColors.secondBackground,
            )
          ],
        ),
      ),
    );
  }
}
