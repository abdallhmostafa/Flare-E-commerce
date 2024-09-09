import 'package:flare/core/configs/route/routes.dart';
import 'package:flare/core/extentions/navigator_extention.dart';
import 'package:flare/presentaion/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBlocListener extends StatelessWidget {
  const SplashBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticatedState) {
          context.pushReplacementNamed(Routes.signInPage);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
