import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';
import 'package:flare/domain/order/use_case/get_cart_products_use_case.dart';
import 'package:flare/domain/order/use_case/remove_all_ordered_product_use_case.dart';
import 'package:flare/domain/order/use_case/remove_cart_products_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_ordered_products_cart_state.dart';

class GetOrderedProductsCartCubit extends Cubit<GetOrderedProductsCartState> {
  GetOrderedProductsCartCubit() : super(GetOrderedProductsCartLoadingState());

  Future<void> getOrderedProducts() async {
    final response =
        await AppServiceLocator.getIt.get<GetCartProductsUseCase>().call();
    response.fold(
      (failure) => emit(
        GetOrderedProductsCartFailureState(
          failureMessage: failure.toString(),
        ),
      ),
      (data) => emit(
        GetOrderedProductsCartSuccessState(orderedProducts: data),
      ),
    );
  }

  Future<void> removeOrderedProduct({required String id}) async {
    emit(GetOrderedProductsCartLoadingState());
    final response = await AppServiceLocator.getIt<RemoveCartProductsUseCase>()
        .call(params: id);
    response.fold(
      (failure) => emit(
        GetOrderedProductsCartFailureState(
          failureMessage: failure.toString(),
        ),
      ),
      (data) => getOrderedProducts(),
    );
  }

  Future<void> removeAllOrderedProduct(
      {required List<ProductOrderedEntity> orderedProducts}) async {
    emit(GetOrderedProductsCartLoadingState());
    final response =
        await AppServiceLocator.getIt<RemoveAllOrderedProductUseCase>()
            .call(params: orderedProducts);
    response.fold(
      (failure) => emit(
        GetOrderedProductsCartFailureState(
          failureMessage: failure.toString(),
        ),
      ),
      (data) => getOrderedProducts(),
    );
  }
}
