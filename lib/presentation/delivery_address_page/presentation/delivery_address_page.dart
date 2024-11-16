import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/app_bar/basic_app_bar.dart';
import 'package:flare/core/constants/app_constant.dart';
import 'package:flare/presentation/delivery_address_page/presentation/widgets/address_form_section.dart';
import 'package:flare/presentation/delivery_address_page/presentation/widgets/delivary_address_save_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeliveryAddressPage extends StatelessWidget {
  const DeliveryAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: BasicAppBar(
          isCenterTitle: true,
          title: "Add Address",
        ),
      ),
      body: Container(
        height: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: AppConstant.horizontalScreenPadding,
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Space.verticalSpace(30),
                  const AddressFormSection(),
                  Space.verticalSpace(12),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 12.h,
              child: const DelivaryAddressSaveButton(),
            ),
          ],
        ),
      ),
    );
  }
}
