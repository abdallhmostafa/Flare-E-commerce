import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeListItems extends StatelessWidget {
  const SizeListItems({super.key, required this.sizes});
  final List<String> sizes;
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
              Text("Size", style: Theme.of(context).textTheme.headlineMedium),
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
            itemCount: sizes.length,
            separatorBuilder: (context, index) => Space.verticalSpace(14),
            itemBuilder: (context, index) {
              return BlocBuilder<SelectSizeCubit, String>(
                builder: (context, state) {
                  return ListTile(
                    onTap: () {
                      context.read<SelectSizeCubit>().selectSize(sizes[index]);
                      context.pop();
                    },
                    tileColor: state == sizes[index]
                        ? AppColors.primary
                        : AppColors.secondBackground,
                    title: Text(sizes[index],
                        style: Theme.of(context).textTheme.labelMedium),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(55.r),
                    ),
                    trailing: state == sizes[index]
                        ? const Icon(
                            Icons.check,
                            color: AppColors.white,
                          )
                        : null,
                  );
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
