import 'package:flare/core/configs/route/app_routes.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentation/home/pages/home_page.dart';
import 'package:flare/presentation/notification_page/presentation/notification_page.dart';
import 'package:flare/presentation/orders_page/presentation/orders_page.dart';
import 'package:flare/presentation/profile/presentation/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: _buildScreens(),
        items: _navBarsItems(),
        hideOnScrollSettings:
            const HideOnScrollSettings(hideNavBarOnScroll: true),

        navBarStyle: NavBarStyle.style3,
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        padding: EdgeInsets.zero,
        backgroundColor: AppColors.background,
        isVisible: true,
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,

        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings(
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,

        // Choose the nav bar style with this property
      ),
    );
  }

  List<Widget> _buildScreens() {
    return const [
      HomePage(),
      NotificationPage(),
      OrdersPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute,
        ),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bell),
        title: ("Notification"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.bill),
        title: ("Bill"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        activeColorPrimary: AppColors.primary,
        inactiveColorPrimary: const Color.fromRGBO(255, 255, 255, 0.5),
        routeAndNavigatorSettings: const RouteAndNavigatorSettings(
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    ];
  }
}
