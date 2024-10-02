import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/favorite_icon_button/favorite_icon_button.dart';
import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.networkImage,
    required this.productName,
    required this.price,
    required this.deccoutPrice,
  });
  final String? networkImage;
  final String productName;
  final String price;
  final String deccoutPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      height: 300.h,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _imagePart(),
              _productNameAndPricePart(context),
            ],
          ),
          Positioned(
            top: 8.h,
            right: 8.w,
            child: const FavoriteIconButton(),
          ),
        ],
      ),
    );
  }

  Container _productNameAndPricePart(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
      ),
      child: Column(
        children: [
          Text(
            productName,
            style: Theme.of(context).textTheme.labelSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Space.verticalSpace(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$price\$",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              Space.horizotalSpace(10),
              Text(
                deccoutPrice,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Expanded _imagePart() {
    return Expanded(
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
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(networkImage!),
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              placeholder: (context, url) => _imageShimmer(),
            ),
    );
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
