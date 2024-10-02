import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 300.h,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(right: 12),
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColors.secondBackground,
              highlightColor: const Color.fromARGB(255, 245, 245, 245),
              period: const Duration(milliseconds: 700),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Container(
                  color: AppColors.secondBackground,
                ),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: AppColors.secondBackground,
            period: const Duration(milliseconds: 700),
            highlightColor: const Color.fromARGB(255, 245, 245, 245),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
              color: AppColors.secondBackground,
              child: Column(
                children: [
                  SizedBox(
                    width: 80.w,
                    height: 20.h,
                  ),
                  Space.verticalSpace(6),
                  SizedBox(
                    width: 60.w,
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
