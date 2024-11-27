part of 'get_ordered_products_cubit.dart';

@immutable
sealed class GetOrderedProductsState {}

final class GetOrderedProductsLoadingState extends GetOrderedProductsState {}
final class GetOrderedProductsFailureState extends GetOrderedProductsState {
  final  String message;
  
    GetOrderedProductsFailureState({required this.message});
}
final class GetOrderedProductsSuccessState extends GetOrderedProductsState {
 final  List<OrderedProductsEntity> orderedProducts;

  GetOrderedProductsSuccessState({required this.orderedProducts});
}
