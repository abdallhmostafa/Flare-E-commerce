import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/product_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImagesSection extends StatelessWidget {
  const ProductImagesSection({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 260.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            scrollDirection: Axis.horizontal,
            itemCount: productEntity.images.length,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ProductImageItem(
                networkImage: productEntity.images[index],
              );
            },
          ),
        ),
        Space.verticalSpace(24),
        Text(
          productEntity.title,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Space.verticalSpace(15),
        Text(
          "\$${productEntity.price}",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
