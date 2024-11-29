import 'package:flare/core/configs/theme/app_colors.dart';
import 'package:flare/presentation/splash/pages/splash_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            const FittedBox(
                    child: Text("Flare",
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: 150,
                            fontWeight: FontWeight.w900)))
                .animate(
                  autoPlay: true,
                )
                .shimmer(
                    duration: const Duration(milliseconds:1900),
                    curve: Curves.easeInOut,
                    colors: [
                      AppColors.white,
                      AppColors.primary,
                      AppColors.white,
                    ],
                    angle: 360),
            const SplashBlocListener(),
          ],
        ),
      ),
    );
  }
}
