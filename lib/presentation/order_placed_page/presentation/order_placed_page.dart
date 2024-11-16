import 'package:flare/common/helpers/space.dart';
import 'package:flare/common/widgets/button/app_basic_button.dart';
import 'package:flare/core/configs/assets/app_images_assets.dart';
import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPlacedPage extends StatelessWidget {
  const OrderPlacedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (result, d) {
        context.pushReplacementNamed(Routes.homePage);
      },
      child: Scaffold(
        body: Container(
          color: AppColors.primary,
          child: Column(
            children: [
              const Expanded(child: SizedBox.shrink()),
              Expanded(
                flex: 4,
                child: Image.asset(
                  AppImagesAssets.orderPlaced,
                  height: 250.h,
                  width: 320.w,
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.w,
                    vertical: 40.h,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColors.secondBackground,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Order Placed\nSuccessfully",
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.headlineLarge),
                            Space.verticalSpace(25),
                            Text("You will recieve an email confirmation",
                                textAlign: TextAlign.center,
                                style:
                                    Theme.of(context).textTheme.displaySmall),
                            Space.verticalSpace(10),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: AppBasicButton(
                            onPressed: () {}, text: "See Order details"),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
