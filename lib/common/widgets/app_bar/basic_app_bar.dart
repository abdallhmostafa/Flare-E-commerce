import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget {
  const BasicAppBar({
    super.key,
    this.text,
    this.hideBackArrorw, this.color,
  });
  final String? text;
  final bool? hideBackArrorw;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AppBar(
          leadingWidth: 40,
          backgroundColor: color?? Colors.transparent,
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
          title: Text(text ?? ''),
        ),
      ),
    );
  }
}
