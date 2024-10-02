import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerHeaderSection extends StatelessWidget {
  const ShimmerHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          decoration: const BoxDecoration(
            color: AppColors.secondBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Space.horizotalSpace(5),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        Container(
          width: 40.w,
          height: 40.h,
          color: AppColors.secondBackground,
        )
      ],
    );
  }
}
