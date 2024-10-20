import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_quantity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectQuantitySection extends StatelessWidget {
  const SelectQuantitySection({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.all(Radius.circular(55.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Quantity",
                    style: Theme.of(context).textTheme.labelMedium),
                Row(
                  children: [
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        context.read<SelectQuantityCubit>().decrement();
                      },
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                    ),
                    Space.horizotalSpace(20),
                    BlocBuilder<SelectQuantityCubit, int>(
                      builder: (context, state) {
                        return Text(
                          state.toString(),
                          style: Theme.of(context).textTheme.labelMedium,
                        );
                      },
                    ),
                    Space.horizotalSpace(20),
                    InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        context.read<SelectQuantityCubit>().increment();
                      },
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
