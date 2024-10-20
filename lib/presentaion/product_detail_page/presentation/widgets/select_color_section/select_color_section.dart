import 'package:flare/common/helpers/app_bottom_sheet.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/domain/product/product_entity/color_entity.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_color_cubit.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/select_color_section/color_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectColorSection extends StatelessWidget {
  const SelectColorSection({super.key, required this.colorEntity});
  final List<ColorEntity> colorEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.showBottomSheet(
          context,
          BlocProvider<SelectColorCubit>.value(
            value: context.read<SelectColorCubit>(),
            child: ColorListItems(colorEntity: colorEntity),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.all(Radius.circular(55.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Color", style: Theme.of(context).textTheme.labelMedium),
            Row(
              children: [
                BlocBuilder<SelectColorCubit, String>(
                  builder: (context, state) {
                    return Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          color: convertStringToColor(state),
                          shape: BoxShape.circle,
                        ));
                  },
                ),
                Space.horizotalSpace(20),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Color convertStringToColor(String color) {
    return switch (color) {
      'Orange' => const Color(0xFFEC6D26),
      'White' => const Color(0xFFFFFFFF),
      'Blue' => const Color(0xFF4468E5),
      _ => Colors.transparent,
    };
  }
}
