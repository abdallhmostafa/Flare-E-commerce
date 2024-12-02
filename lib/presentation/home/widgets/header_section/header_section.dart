import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentation/home/logic/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:flare/presentation/home/widgets/header_section/shimmer_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstant.horizontalScreenPadding.w,
      ),
      child: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
        builder: (context, state) {
          if (state is GetUserInfoLoadingState) {
            return Shimmer.fromColors(
                baseColor: AppColors.secondBackground,
                highlightColor: Colors.grey,
                child: const ShimmerHeaderSection());
          } else if (state is GetUserInfoSuccessState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _userProfileImage(state, context),
                _userGender(state, context),
              ],
            );
          } else {
            return Text((state as GetUserInfoFailureState).toString(),
                style: Theme.of(context).textTheme.labelMedium);
          }
        },
      ),
    );
  }

  Container _userGender(GetUserInfoSuccessState state, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: const BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Text(
        state.userResponseEntity.gender == 1 ? "Men" : "Women",
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  GestureDetector _userProfileImage(
      GetUserInfoSuccessState state, BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.profilePage,
          argument: state.userResponseEntity),
      child: Container(
        width: 40.w,
        height: 40.h,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: state.userResponseEntity.image.isEmpty
                ?  AssetImage(state.userResponseEntity.gender ==1? AppImagesAssets.maleProfileImg: AppImagesAssets.femaleProfileImg)
                : NetworkImage(state.userResponseEntity.image),
          ),
        ),
      ),
    );
  }
}
