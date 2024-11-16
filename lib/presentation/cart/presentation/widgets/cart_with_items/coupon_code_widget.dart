import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CouponCodeWidget extends StatelessWidget {
  const CouponCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.all(Radius.circular(AppConstant.radius12)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppVectorsAssets.discountShape,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.fitHeight,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                hintText: 'Enter Coupon Code',
                hintStyle: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    fontSize: 12.sp),
                border: InputBorder.none,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                color: AppColors.white,
                size: 26.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
