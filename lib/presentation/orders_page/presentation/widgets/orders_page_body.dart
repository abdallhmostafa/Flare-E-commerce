import 'package:flutter/material.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentation/orders_page/presentation/widgets/orders_bloc_section.dart';

class OrdersPageBody extends StatelessWidget {
  const OrdersPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstant.horizontalScreenPadding,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Space.verticalSpace(30),
          const OrdersBlocSection(),
          Space.verticalSpace(16),
        ],
      ),
    );
  }
}
