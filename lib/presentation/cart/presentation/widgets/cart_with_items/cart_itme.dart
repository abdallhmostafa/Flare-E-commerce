import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentation/cart/logic/cubit/get_ordered_products_cart_cubit.dart';
import 'package:flare/presentation/cart/presentation/widgets/cart_with_items/add_or_remove_item_cart_quantity_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartItme extends StatelessWidget {
  const CartItme(
      {super.key,
      required this.title,
      required this.size,
      required this.color,
      required this.price,
      required this.image,
      required this.id});
  final String title;
  final String size;
  final String color;
  final String price;
  final String image;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.all(Radius.circular(AppConstant.radius12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                _image(),
                Space.horizotalSpace(12),
                _titleSizeAndColor(context),
              ],
            ),
          ),
          _priceAndButton(context),
        ],
      ),
    );
  }

  CachedNetworkImage _image() {
    Shimmer imageShimmerLoading() {
      return Shimmer.fromColors(
        baseColor: AppColors.secondBackground,
        highlightColor: const Color.fromARGB(255, 245, 245, 245),
        child: Container(
          width: 64.w,
          height: 64.h,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: image,
      errorWidget: (context, url, error) =>
          const Icon(Icons.error_outline_rounded),
      fadeInDuration: const Duration(milliseconds: 250),
      imageBuilder: (context, imageProvider) => Container(
        width: 64.w,
        height: 64.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => imageShimmerLoading(),
    );
  }

  Expanded _titleSizeAndColor(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Space.verticalSpace(8),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    'Size - ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.grey),
                  ),
                  Text(
                    size,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Space.horizotalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Color - ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.grey),
                  ),
                  Text(
                    color,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _priceAndButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          price,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        Space.verticalSpace(8),
        AddOrRemoveItemCartQuantityButton(
            isAddButton: false,
            onTap: () {
              context
                  .read<GetOrderedProductsCartCubit>()
                  .removeOrderedProduct(id: id);
            }),
      ],
    );
  }
}
