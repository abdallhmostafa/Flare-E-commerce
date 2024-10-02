import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit({required this.useCase}) : super(GetProductLoadingState());
  final UseCase useCase;

  void getProducts({dynamic params}) async {
    final response = await useCase.call(params: params);
    response.fold(
      (failure) => emit(
        GetProductFailureState(
          failureMessage: failure.toString(),
        ),
      ),
      (product) => emit(
        GetProductSuccessState(products: product as List<ProductEntity>),
      ),
    );
  }
}
