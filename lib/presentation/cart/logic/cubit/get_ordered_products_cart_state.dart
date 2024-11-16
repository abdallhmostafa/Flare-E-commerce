part of 'get_ordered_products_cart_cubit.dart';

@immutable
sealed class GetOrderedProductsCartState {}

 final class GetOrderedProductsCartLoadingState extends GetOrderedProductsCartState {}
final class GetOrderedProductsCartSuccessState extends GetOrderedProductsCartState {
  final List<ProductOrderedEntity> orderedProducts;

  GetOrderedProductsCartSuccessState({required this.orderedProducts});
}
final class GetOrderedProductsCartFailureState extends GetOrderedProductsCartState {
  final String failureMessage;

  GetOrderedProductsCartFailureState({required this.failureMessage});
}
