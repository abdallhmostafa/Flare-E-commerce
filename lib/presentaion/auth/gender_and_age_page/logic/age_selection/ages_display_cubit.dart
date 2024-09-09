import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/auth/usecase/get_ages_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ages_display_state.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesDisplayLoadingState());
  Future<void> displayAges() async {
    final data = await AppServiceLocator.getIt<GetAgesUseCase>().call();
    data.fold(
      (errorMessage) =>
          emit(AgesDisplayFailureState(message: errorMessage.toString())),
      (ages) => emit(AgesDisplaySuccessState(ages: ages)),
    );
  }
}
