import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/domain/auth/entity/user_response_entity.dart';
import 'package:flare/presentation/profile_page/presentation/widgets/setting_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.userDate});
  final UserResponseEntity userDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          hideBackArrorw: true,
          title: "Profile",
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: AppConstant.horizontalScreenPadding,
          ),
          child: Column(
            children: [
              Space.verticalSpace(30),
              userDate.image.isEmpty
                  ? Image.asset(
                      userDate.gender == 1
                          ? AppImagesAssets.maleProfileImg
                          : AppImagesAssets.femaleProfileImg,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      userDate.image,
                      fit: BoxFit.fill,
                    ),
              Space.verticalSpace(30),
              SettingItem(
                description: "My Favorites",
                onTap: () {
                  context.pushNamed(Routes.favoritesPage);
                },
              ),
              Space.verticalSpace(16),
              SettingItem(
                description: "Addresses",
                onTap: () {},
              ),
              Space.verticalSpace(16),
              SettingItem(
                description: "Help",
                onTap: () {},
              ),
              Space.verticalSpace(16),
              SettingItem(
                description: "Support",
                onTap: () {},
              ),
              Space.verticalSpace(16),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Log Out",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Space.verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}
