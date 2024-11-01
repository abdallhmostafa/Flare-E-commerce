import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({
    super.key,
    this.hideBackArrorw,
    this.color,
    this.actions,
    this.titleWidget,
    this.title,
    this.isCenterTitle,
  });
  final String? title;
  final bool? hideBackArrorw;
  final bool? isCenterTitle;
  final Color? color;
  final List<Widget>? actions;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: AppConstant.horizontalScreenPadding / 2,
        right: AppConstant.horizontalScreenPadding / 2,
      ),
      child: AppBar(
        actions: actions,
        leadingWidth: 40.w,
        backgroundColor: color ?? Colors.transparent,
        forceMaterialTransparency: true,
        leading: (hideBackArrorw ?? false)
            ? const SizedBox.shrink()
            : Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondBackground,
                ),
                child: GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.white,
                    size: 20,
                  ),
                ),
              ),
        elevation: 0,
        centerTitle: isCenterTitle,
        title: titleWidget ?? Text(title ?? ''),
      ),
    );
  }
}
