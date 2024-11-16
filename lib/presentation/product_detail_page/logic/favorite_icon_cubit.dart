import 'package:flare/app_service_locator.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/domain/product/use_cases/is_favorite_product_use_case.dart';
import 'package:flare/domain/product/use_cases/remove_or_add_favorite_product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  void isFavorite({required String productId}) async {
    final result = await AppServiceLocator.getIt<IsFavoriteProductUseCase>()
        .call(params: productId);
    emit(result);
  }

  void onTap({required ProductEntity product}) async {
    final result =
        await AppServiceLocator.getIt<RemoveOrAddFavoriteProductUseCase>()
            .call(params: product);
    result.fold(
      (l) => {},
      (r) => state ? emit(false) : emit(true),
    );
  }
}
