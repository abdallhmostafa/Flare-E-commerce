import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, this.title, this.networkImage});
  final String? title;
  final String? networkImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            child: networkImage == null || networkImage!.isEmpty
                ? Image.asset(
                    AppImagesAssets.orderPlaced,
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: networkImage!,
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
          Space.verticalSpace(5),
          Text(
            title ?? 'Title',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }

  Shimmer _imageShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: AppColors.secondBackground,
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: Container(
        width: 60.w,
        height: 60.h,
        decoration: const BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
