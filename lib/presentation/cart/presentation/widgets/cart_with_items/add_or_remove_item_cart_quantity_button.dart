import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddOrRemoveItemCartQuantityButton extends StatelessWidget {
  const AddOrRemoveItemCartQuantityButton(
      {super.key, this.isAddButton, required this.onTap});
  final bool? isAddButton;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color.fromRGBO(142, 108, 239, 0.2),
      splashFactory: InkRipple.splashFactory,
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
        ),
        child: Icon(
          isAddButton ?? true ? Icons.add : Icons.remove,
          color: AppColors.white,
          size: 16.sp,
        ),
      ),
    );
  }
}
