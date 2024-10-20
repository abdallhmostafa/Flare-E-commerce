import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({super.key, this.onTap, this.paddingSize, this.iconSize});
  final VoidCallback? onTap;
  final double? paddingSize;
  final double? iconSize;

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      highlightColor: AppColors.primary,
      focusColor: AppColors.primary,
      hoverColor: AppColors.primary,
      splashColor: AppColors.primary,
      customBorder: const CircleBorder(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(widget.paddingSize ?? 3.w),
        decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 224, 224, 224),
          color: AppColors.secondBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
          color: isFavorite ? AppColors.primary : AppColors.white,
          size:widget.iconSize?? 20.w,
        ),
      ),
    );
  }
}
