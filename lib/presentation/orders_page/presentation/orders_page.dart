import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/presentation/orders_page/logic/cubit/get_ordered_products_cubit.dart';
import 'package:flare/presentation/orders_page/presentation/widgets/orders_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          hideBackArrorw: true ,
          title: "Orders",
        ),
      ),
      body: BlocProvider(
        create: (_) => GetOrderedProductsCubit()..getOrderedProducts(),
        child: const OrdersPageBody(),
      ),
    );
  }
}
