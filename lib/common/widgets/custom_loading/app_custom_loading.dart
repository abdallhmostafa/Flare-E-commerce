import 'package:flare/core/configs/assets/app_json_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppCustomLoading extends StatelessWidget {
  const AppCustomLoading({super.key, this.height, this.width});
  final double? height ;
  final double? width ;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppJsonAssets.loading4,
        height: height,
        width: width,
      ),
    );
  }
}
