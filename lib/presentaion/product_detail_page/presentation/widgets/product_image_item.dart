import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductImageItem extends StatelessWidget {
  const ProductImageItem({super.key, this.networkImage});
  final String? networkImage;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250.h,
        width: 180.w,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(AppConstant.radius12)),
        ),
        child: InteractiveViewer(
          child: networkImage == null || networkImage!.isEmpty
              ? Image.asset(
                  AppImagesAssets.orderPlaced,
                  fit: BoxFit.fitHeight,
                )
              : CachedNetworkImage(
                  cacheKey: networkImage!,
                  imageUrl: networkImage!,
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline_rounded),
                  fadeInDuration: const Duration(milliseconds: 250),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppConstant.radius12)),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(networkImage!),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => _imageShimmer(),
                ),
        ));
  }

  Shimmer _imageShimmer() {
    return Shimmer.fromColors(
      baseColor: AppColors.secondBackground,
      highlightColor: const Color.fromARGB(255, 245, 245, 245),
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstant.radius12),
          ),
        ),
      ),
    );
  }
}
