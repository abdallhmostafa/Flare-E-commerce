import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ImageAndTitleItem extends StatelessWidget {
  const ImageAndTitleItem(
      {super.key,
      required this.networkImage,
      required this.title,
      required this.onTap});
  final String networkImage;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: 8.h,
          left: AppConstant.horizontalScreenPadding,
          right: AppConstant.horizontalScreenPadding),
      child: ListTile(
        tileColor: AppColors.secondBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.w),
          ),
        ),
        hoverColor: Colors.grey[200],
        splashColor: AppColors.primary,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        onTap: onTap,
        leading: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.white,
            border: Border.all(
              color: AppColors.white,
              width: 1.w,
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: networkImage,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline_rounded),
            fadeInDuration: const Duration(milliseconds: 250),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.fitHeight),
              ),
            ),
            placeholder: (context, url) => _imageShimmerLoading(),
          ),
        ),
        horizontalTitleGap: 10.w,
        titleAlignment: ListTileTitleAlignment.center,
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}

Shimmer _imageShimmerLoading() {
  return Shimmer.fromColors(
    baseColor: AppColors.white,
    highlightColor: AppColors.grey,
    child: Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(
          color: AppColors.white,
          width: 1.w,
        ),
      ),
    ),
  );
}
