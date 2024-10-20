import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/domain/product/product_entity/color_entity.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_color_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorListItems extends StatelessWidget {
  const ColorListItems({super.key, required this.colorEntity});
  final List<ColorEntity> colorEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstant.horizontalScreenPadding,
      ),
      child: Column(
        children: [
          Space.verticalSpace(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text("Color", style: Theme.of(context).textTheme.headlineMedium),
              const Spacer(),
              IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(
                  Icons.close,
                  size: 30,
                  color: AppColors.white,
                ),
              )
            ],
          ),
          Space.verticalSpace(26),
          Expanded(
              child: ListView.separated(
            itemCount: colorEntity.length,
            separatorBuilder: (context, index) => Space.verticalSpace(14),
            itemBuilder: (context, index) {
              return BlocBuilder<SelectColorCubit, String>(
                builder: (context, state) {
                  return ListTile(
                      onTap: () {
                        context
                            .read<SelectColorCubit>()
                            .selectColor(colorEntity[index].title);
                        context.pop();
                      },
                      tileColor: state == colorEntity[index].title
                          ? AppColors.primary
                          : AppColors.secondBackground,
                      title: Text(
                        colorEntity[index].title,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 4,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55.r),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: convertStringToColor(index),
                                shape: BoxShape.circle,
                                border: state == colorEntity[index].title
                                    ? Border.all(
                                        color: AppColors.white, width: 2)
                                    : null),
                          ),
                          Space.horizotalSpace(20),
                          (state == colorEntity[index].title)
                              ? const Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                )
                              : Space.horizotalSpace(20),
                        ],
                      ));
                },
              );
            },
          ))
        ],
      ),
    );
  }

  Color convertStringToColor(int index) {
    return switch (colorEntity[index].title) {
      'Orange' => const Color(0xFFEC6D26),
      'White' => const Color(0xFFFFFFFF),
      'Blue' => const Color(0xFF4468E5),
      _ => Colors.transparent,
    };
  }
}
