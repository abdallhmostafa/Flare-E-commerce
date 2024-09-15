part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoLoadingState extends GetUserInfoState {}

final class GetUserInfoSuccessState extends GetUserInfoState {
  final UserResponseEntity userResponseEntity;

  GetUserInfoSuccessState({required this.userResponseEntity});
}

final class GetUserInfoFailureState extends GetUserInfoState {
  final String failureMessage;

  GetUserInfoFailureState({required this.failureMessage});
}
