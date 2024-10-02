part of 'get_product_cubit.dart';

@immutable
sealed class GetProductState {}

final class GetProductLoadingState extends GetProductState {}

final class GetProductFailureState extends GetProductState {
  final String failureMessage;

  GetProductFailureState({required this.failureMessage});
}

final class GetProductSuccessState extends GetProductState {
  final List<ProductEntity> products;

  GetProductSuccessState({required this.products});
}
