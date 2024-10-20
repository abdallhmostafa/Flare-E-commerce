import 'package:flare/app_service_locator.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/widgets/button/app_basic_reactive_button.dart';
import 'package:flare/common/widgets/custom_snak_bar_wearing/custom_snak_bar_wearing.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/domain/order/order_use_case.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_color_cubit.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_quantity_cubit.dart';
import 'package:flare/presentaion/product_detail_page/logic/select_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBagButton extends StatelessWidget {
  const AddToBagButton({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return AppBasicReactiveButton(
      onPressed: () {
        if (context.read<SelectSizeCubit>().state.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(appSnackBarWearing(
            context: context,
            message: "Please select the size",
          ));
        } else if (context.read<SelectColorCubit>().state.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(appSnackBarWearing(
            context: context,
            message: "Please select the color",
          ));
        } else if (context.read<SelectQuantityCubit>().state == 0) {
          ScaffoldMessenger.of(context).showSnackBar(appSnackBarWearing(
            context: context,
            message: "Please select the quantity",
          ));
        } else if (context.read<AppBasicReactiveButtonCubit>().state
            is AppBasicReactiveButtonSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(appSnackBarWearing(
            context: context,
            message: "you have already added this product to the bag",
          ));
        } else {
          context.read<AppBasicReactiveButtonCubit>().submit(
                useCase: AppServiceLocator.getIt<AddOrderUseCase>(),
                params: OrderModelRequest(
                  productId: productEntity.productId,
                  productTitle: productEntity.title,
                  productQuantity: context.read<SelectQuantityCubit>().state,
                  productColor: context.read<SelectColorCubit>().state,
                  productSize: context.read<SelectSizeCubit>().state,
                  productPrice: productEntity.price,
                  totalPrice: productEntity.price *
                      context.read<SelectQuantityCubit>().state,
                  productImage: productEntity.images.first,
                  createdAt: DateTime.now().toString(),
                ),
              );
        }
      },
      haveChild: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<SelectQuantityCubit, int>(
            builder: (context, state) {
              return Text(
                "\$${(productEntity.price * state).toStringAsFixed(2)}",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: AppColors.white),
              );
            },
          ),
          Text(
            "Add to Bag",
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
