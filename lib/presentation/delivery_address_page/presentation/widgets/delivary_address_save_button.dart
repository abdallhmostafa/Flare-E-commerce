import 'package:flare/app_service_locator.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_basic_reactive_button_cubit.dart';
import 'package:flare/common/app_basic_reactive_button_cubit/app_reactive_submit_bloc_listner.dart';
import 'package:flare/common/widgets/button/app_basic_reactive_button.dart';
import 'package:flare/common/widgets/custom_error/app_snack_bar_error.dart';
import 'package:flare/common/widgets/custom_snak_bar_wearing/custom_snak_bar_wearing.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/domain/order/use_case/delivery_address_use_case.dart';
import 'package:flare/presentation/delivery_address_page/logic/delivery_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DelivaryAddressSaveButton extends StatelessWidget {
  const DelivaryAddressSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final DeliveryAddressCubit deliveryAddressCubit =
        context.read<DeliveryAddressCubit>();

    return Column(
      children: [
        AppBasicReactiveButton(
          onPressed: () {
            if (deliveryAddressCubit.formKey.currentState!.validate()) {
              if (deliveryAddressCubit.state == false) {
                deliveryAddressCubit.emitSuccess();
              }
              switch (context.read<AppBasicReactiveButtonCubit>().state) {
                case AppBasicReactiveButtonLoadingState _:
                  ScaffoldMessenger.of(context).showSnackBar(
                    appSnackBarWearing(
                      context: context,
                      message: "Saving address...",
                    ),
                  );

                  break;

                  case AppBasicReactiveButtonFailureState _:
                  ScaffoldMessenger.of(context).showSnackBar(
                    appSnackBarError(
                      context: context,
                      errorMessge: "Failed to save address",
                    ),
                  );
                default:
                  context.read<AppBasicReactiveButtonCubit>().submit(
                        useCase:
                            AppServiceLocator.getIt<DeliveryAddressUseCase>(),
                        params: DeliveryAddressModel(
                          streetAddress:
                              deliveryAddressCubit.streetAddressController.text,
                          city: deliveryAddressCubit.cityController.text,
                          state: deliveryAddressCubit.stateController.text,
                          zipCode: deliveryAddressCubit.zipCode.text,
                        ),
                      );
              }
            }
          },
          text: "Save",
        ),
        AppReactiveSubmitBlocListner(
          successMessage: "Address saved successfully",
          forSuccessState: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
