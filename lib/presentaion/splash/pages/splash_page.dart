import 'package:flare/core/configs/assets/app_vectors_assets.dart';
import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentaion/splash/pages/splash_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppVectorsAssets.appLogo),
            const SplashBlocListener(),
          ],
        ),
      ),
    );
  }
}
