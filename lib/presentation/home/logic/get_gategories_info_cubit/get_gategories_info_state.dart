part of 'get_gategories_info_cubit.dart';

@immutable
sealed class GetGategoriesState {}

final class GetGategoriesLoadingState extends GetGategoriesState {}

final class GetGategoriesSuccessState extends GetGategoriesState {
  final List<CategoryEntity> categories;

  GetGategoriesSuccessState({required this.categories});
}

final class GetGategoriesFailureState extends GetGategoriesState {
  final String failureMessage;

  GetGategoriesFailureState({required this.failureMessage});
}
