import 'package:flare/common/helpers/app_bottom_sheet.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_size_cubit.dart';
import 'package:flare/presentaion/product_detail_page/presentation/widgets/select_size_section/size_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectSizeSection extends StatelessWidget {
  const SelectSizeSection({super.key, required this.sizes});
  final List<String> sizes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppBottomSheet.showBottomSheet(
          context,
          BlocProvider<SelectSizeCubit>.value(
            value: context.read<SelectSizeCubit>(),
            child: SizeListItems(
              sizes: sizes,
            ),
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
            Text("Size", style: Theme.of(context).textTheme.labelMedium),
            Row(
              children: [
                BlocBuilder<SelectSizeCubit, String>(
                  builder: (context, state) {
                    return Text(
                      state,
                      style: Theme.of(context).textTheme.labelMedium,
                    );
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
}
