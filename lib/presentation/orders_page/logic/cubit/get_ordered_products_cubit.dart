import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/order/entities/ordered_products_entity.dart';
import 'package:flare/domain/order/use_case/get_ordered_products_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_ordered_products_state.dart';

class GetOrderedProductsCubit extends Cubit<GetOrderedProductsState> {
  GetOrderedProductsCubit() : super(GetOrderedProductsLoadingState());

  void getOrderedProducts() async {
    final orderedData =
        await AppServiceLocator.getIt<GetOrderedProductsUseCase>().call();

    orderedData.fold(
      (failure) =>
          emit(GetOrderedProductsFailureState(message: failure.message)),
      (orderedProducts) => emit(
          GetOrderedProductsSuccessState(orderedProducts: orderedProducts)),
    );
  }
}
