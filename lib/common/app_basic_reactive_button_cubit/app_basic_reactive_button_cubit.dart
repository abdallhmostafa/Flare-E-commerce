import 'package:dartz/dartz.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_basic_reactive_button_state.dart';

class AppBasicReactiveButtonCubit extends Cubit<AppBasicReactiveButtonState> {
  AppBasicReactiveButtonCubit() : super(AppBasicReactiveButtonInitialState());

  Future<void> submit({dynamic params, required UseCase useCase}) async {
    emit(AppBasicReactiveButtonLoadingState());
    try {
      final Either result = await useCase(params: params);
      result.fold(
        (failure) => emit(AppBasicReactiveButtonFailureState(errorMessage: failure.toString())),
        (success) => emit(AppBasicReactiveButtonSuccessState()),
      );
    } catch (e) {
      emit(AppBasicReactiveButtonFailureState(errorMessage: e.toString()));
    }
  }
}
