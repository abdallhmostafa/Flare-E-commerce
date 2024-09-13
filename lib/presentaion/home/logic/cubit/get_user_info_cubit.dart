import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/auth/entity/user_response_entity.dart';
import 'package:flare/domain/auth/usecase/get_user_data_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit() : super(GetUserInfoLoadingState());


  void getUserInfo() async {
    final returedData =
        await AppServiceLocator.getIt.get<GetUserDataUseCase>().call();
    returedData.fold(
      (failure) => emit(
        GetUserInfoFailureState(
          failureMessage: failure.toString(),
        ),
      ),
      (data) => emit(
        GetUserInfoSuccessState(userResponseEntity: data),
      ),
    );
  }
}
