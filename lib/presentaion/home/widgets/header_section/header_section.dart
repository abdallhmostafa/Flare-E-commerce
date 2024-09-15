import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentaion/home/logic/get_user_info_cubit/get_user_info_cubit.dart';
import 'package:flare/presentaion/home/widgets/header_section/shimmer_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetUserInfoCubit()..getUserInfo(),
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
                _userProfileImage(state),
                _userGender(state, context),
                _card(),
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

  Container _card() {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
      child: Icon(
        FontAwesomeIcons.bagShopping,
        size: 16.w,
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
      child: Row(
        children: [
          Text(
            state.userResponseEntity.gender == 1 ? "Men" : "Women",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Space.horizotalSpace(5),
          Icon(
            FontAwesomeIcons.chevronDown,
            size: 14.w,
          ),
        ],
      ),
    );
  }

  Container _userProfileImage(GetUserInfoSuccessState state) {
    return Container(
      width: 40.w,
      height: 40.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: state.userResponseEntity.image.isEmpty
              ? const AssetImage(AppImagesAssets.profile)
              : NetworkImage(state.userResponseEntity.image),
        ),
      ),
    );
  }
}
