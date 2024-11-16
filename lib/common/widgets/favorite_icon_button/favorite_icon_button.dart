import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/presentation/product_detail_page/logic/favorite_icon_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton(
      {super.key,
      this.onTap,
      this.paddingSize,
      this.iconSize,
      required this.product});
  final VoidCallback? onTap;
  final double? paddingSize;
  final double? iconSize;
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<FavoriteIconCubit>().onTap(product: product);
      },
      highlightColor: AppColors.primary,
      focusColor: AppColors.primary,
      hoverColor: AppColors.primary,
      splashColor: AppColors.primary,
      customBorder: const CircleBorder(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.all(paddingSize ?? 3.w),
        decoration: const BoxDecoration(
          // color: Color.fromARGB(255, 224, 224, 224),
          color: AppColors.secondBackground,
          shape: BoxShape.circle,
        ),
        child: BlocBuilder<FavoriteIconCubit, bool>(
          builder: (context, state) {
            return Icon(
              state ? Icons.favorite : Icons.favorite_outline_rounded,
              color: state ? AppColors.primary : AppColors.white,
              size: iconSize ?? 20.w,
            );
          },
        ),
      ),
    );
  }
}
