import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplashState());

  Future<void> appStarted() async {
   await Future.delayed(const Duration(seconds: 2));
    emit(UnAuthenticatedState());
  }
}
