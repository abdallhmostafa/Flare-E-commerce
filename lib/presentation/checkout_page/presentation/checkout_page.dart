import 'package:flare/app_service_locator.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_reactive_submit_bloc_listner.dart';
import 'package:flare/common/helpers/cart_helper.dart';
import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/common/widgets/button/app_basic_reactive_button.dart';
import 'package:flare/common/widgets/price_details_order_section/price_details_order_section.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/data/order/model/order_registration_req.dart';
import 'package:flare/domain/order/entities/delivery_address_entity.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';
import 'package:flare/domain/order/use_case/order_registration_use_case.dart';
import 'package:flare/presentation/checkout_page/presentation/widgets/checkout_list_tile_item.dart';
import 'package:flare/presentation/delivery_address_page/logic/delivery_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.orderedProducts});
  final List<ProductOrderedEntity> orderedProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          title: "Checkout",
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Space.verticalSpace(30),
                BlocBuilder<DeliveryAddressCubit, bool>(
                  builder: (context, state) {
                    final DeliveryAddressCubit deliveryAddressCubit =
                        context.read<DeliveryAddressCubit>();
                    return CheckoutListTileItem(
                      title: "Shipping Address",
                      description: deliveryAddressCubit
                              .stateController.text.isEmpty
                          ? "Add Shipping Address"
                          : "${deliveryAddressCubit.streetAddressController.text}, ${deliveryAddressCubit.cityController.text}, ${deliveryAddressCubit.stateController.text}, ${deliveryAddressCubit.zipCode.text}",
                      onTap: () {
                        context.pushNamed(Routes.deliveryAddressPage);
                      },
                    );
                  },
                ),
                Space.verticalSpace(16),
              ],
            )),
            PriceDetailsSection(
              orderedProducts: orderedProducts,
            ),
            Space.verticalSpace(20),
            SizedBox(
              width: double.infinity,
              child: AppBasicReactiveButton(
                haveChild: true,
                onPressed: () {
                  final DeliveryAddressCubit addressCubit =
                      context.read<DeliveryAddressCubit>();
                  context.read<AppBasicReactiveButtonCubit>().submit(
                        useCase:
                            AppServiceLocator.getIt<OrderRegistrationUseCase>(),
                        params: OrderRegistrationReq(
                          orderedProducts: orderedProducts,
                          deliveryAddress: DeliveryAddressEntity(
                              streetAddress:
                                  addressCubit.streetAddressController.text,
                              city: addressCubit.cityController.text,
                              state: addressCubit.stateController.text,
                              zipCode: addressCubit.zipCode.text),
                          createdAt: DateTime.now().toString(),
                          count: orderedProducts.length,
                          totalPrice:
                              CartHelper.calculateTotalPrice(orderedProducts),
                        ),
                      );
                },
                text: 'Checkout',
                child: _totalPrice(context),
              ),
            ),
            AppReactiveSubmitBlocListner(
              successMessage: "Order Registered Successfully",
              forSuccessState: () {
                context.pushReplacementNamed(
                  Routes.orderPlacedPage,
                );
              },
            ),
            Space.verticalSpace(10),
          ],
        ),
      ),
    );
  }

  Row _totalPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "\$${CartHelper.calculateTotalPrice(orderedProducts).toStringAsFixed(0)}",
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          "Place Order",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: AppColors.white),
        )
      ],
    );
  }
}
