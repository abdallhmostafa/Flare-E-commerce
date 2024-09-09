part of 'app_basic_reactive_button_cubit.dart';

@immutable
sealed class AppBasicReactiveButtonState {}

final class AppBasicReactiveButtonInitialState extends AppBasicReactiveButtonState {}
final class AppBasicReactiveButtonLoadingState extends AppBasicReactiveButtonState {}
final class AppBasicReactiveButtonSuccessState extends AppBasicReactiveButtonState {}
final class AppBasicReactiveButtonFailureState extends AppBasicReactiveButtonState {
  final String errorMessage;
  AppBasicReactiveButtonFailureState({required this.errorMessage});
}
