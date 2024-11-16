import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/text_field/app_text_form_field.dart';
import 'package:flare/presentation/delivery_address_page/logic/delivery_address_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressFormSection extends StatelessWidget {
  const AddressFormSection({super.key});
  @override
  Widget build(BuildContext context) {
    final DeliveryAddressCubit deliveryAddressCubit =
        context.read<DeliveryAddressCubit>();

    return Form(
      key: deliveryAddressCubit.formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Stree Address",
            controller: deliveryAddressCubit.streetAddressController,
            validator: _streeValidate,
          ),
          Space.verticalSpace(12),
          AppTextFormField(
            hintText: "City",
            controller: deliveryAddressCubit.cityController,
            validator: _cityValidate,
          ),
          Space.verticalSpace(12),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  hintText: "State",
                  controller: deliveryAddressCubit.stateController,
                  validator: _stateValidate,
                ),
              ),
              Space.horizotalSpace(14),
              Expanded(
                child: AppTextFormField(
                  hintText: "Zip Code",
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  controller: deliveryAddressCubit.zipCode,
                  validator: _zipCodeValidate,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
            ],
          ),
          Space.verticalSpace(12),
        ],
      ),
    );
  }

  String? _zipCodeValidate(vlaue) {
    if (vlaue!.isEmpty) {
      return "Zip Code is required";
    } else if (vlaue.length < 5) {
      return "Zip Code is too short";
    }
    return null;
  }

  String? _stateValidate(value) {
    if (value!.isEmpty) {
      return "State is required";
    } else if (value.length < 2) {
      return "State is too short";
    }
    return null;
  }

  String? _cityValidate(value) {
    if (value!.isEmpty) {
      return "City is required";
    } else if (value.length < 2) {
      return "City is too short";
    }
    return null;
  }

  String? _streeValidate(value) {
    if (value!.isEmpty) {
      return "Street Address is required";
    } else if (value.length < 5) {
      return "Street Address is too short";
    }
    return null;
  }
}
