import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/auth/usecase/is_user_sign_in_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplashState());

  Future<void> appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    final bool isUserSignIn = await AppServiceLocator.getIt<IsUserSignInUseCase>().call();
    if (isUserSignIn) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
   
  }
}
