import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentation/setting_page/presentation/widgets/setting_item.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          title: "Setting",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: Column(
          children: [
            Space.verticalSpace(30),
            SettingItem(
              description: "My Favorites",
              onTap: () {
                context.pushNamed(Routes.favoritesPage);
              },
            ),
            Space.verticalSpace(16),
            SettingItem(
              description: "My Orders",
              onTap: () {
                context.pushNamed(Routes.ordersPage);
              },
            ),
            Space.verticalSpace(16),
          ],
        ),
      ),
    );
  }
}
