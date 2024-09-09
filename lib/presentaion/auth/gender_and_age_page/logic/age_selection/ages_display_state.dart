part of 'ages_display_cubit.dart';

@immutable
sealed class AgesDisplayState {}

final class AgesDisplayLoadingState extends AgesDisplayState {}
final class AgesDisplaySuccessState extends AgesDisplayState {
  final List<String> ages;

  AgesDisplaySuccessState({required this.ages});
}
final class AgesDisplayFailureState extends AgesDisplayState {
  final String message;

  AgesDisplayFailureState({required this.message});
}
