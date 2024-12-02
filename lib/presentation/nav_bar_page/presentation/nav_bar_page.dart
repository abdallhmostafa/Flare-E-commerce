import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentation/cart/presentation/cart_page.dart';
import 'package:flare/presentation/home/pages/home_page.dart';
import 'package:flare/presentation/nav_bar_page/logic/cubit/nav_bar_cubit.dart';
import 'package:flare/presentation/notification_page/presentation/notification_page.dart';
import 'package:flare/presentation/orders_page/presentation/orders_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    
      create: (context) => NavBarCubit(),
      child: BlocBuilder<NavBarCubit, int>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Scaffold(
            
            body: _buildScreens[state],
            bottomNavigationBar: BottomNavigationBar(

              items: _navBarsItems(),
              currentIndex: state,
              onTap: (index) {
                context.read<NavBarCubit>().changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return const [
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        label: ("Home"),
        backgroundColor: AppColors.background,
        tooltip: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bell),
        label: ("Notifications"),
        backgroundColor: AppColors.background,
        tooltip: "Notifications",
      ),
      BottomNavigationBarItem(
          icon: Icon(Iconsax.bill4),
          label: ("Orders"),
          backgroundColor: AppColors.background,
          tooltip: "Orders"),
      BottomNavigationBarItem(
          icon: Icon(Iconsax.shopping_cart),
          label: ("Cart"),
          backgroundColor: AppColors.background,
          tooltip: "Cart"),
    ];
  }
}

List<Widget> _buildScreens = const [
  HomePage(),
  NotificationPage(),
  OrdersPage(),
  CartPage(),
];
