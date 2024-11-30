import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class OrdersShimmerLoading extends StatelessWidget {
  const OrdersShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => _shimmerItem(),
        separatorBuilder: (context, index) => Space.verticalSpace(12),
        itemCount: 5,
      ),
    );
  }

  Shimmer _shimmerItem() {
    return Shimmer.fromColors(
      baseColor: AppColors.secondBackground,
      period: const Duration(milliseconds: 700),
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 12.w),
        decoration: const BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstant.radius8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.grey,
                  ),
                ),
                Space.horizotalSpace(10),
                Column(
                  children: [
                    Container(
                      width: 100.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppConstant.radius8),
                        ),
                      ),
                    ),
                    Space.verticalSpace(5),
                    Container(
                      width: 50.w,
                      height: 10.h,
                      decoration: const BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppConstant.radius8),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: 30.w,
              height: 30.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
