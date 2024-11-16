import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';
import 'package:flare/domain/product/product_repository/product_domain_repository.dart';

class RemoveOrAddFavoriteProductUseCase implements UseCase<Either, ProductEntity> {
  @override
  Future<Either> call({ProductEntity? params}) {
    return AppServiceLocator.getIt<ProductDomainRepository>()
        .removeOrAddFavoriteProduct(product: params!);
  }
}
