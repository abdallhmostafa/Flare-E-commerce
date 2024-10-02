import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/product/product_repository/product_domain_repository.dart';

class GetProductsByCategoryIdUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({ String? params}) {
    return AppServiceLocator.getIt<ProductDomainRepository>()
        .getProductsByCategoryId(categoryId: params!);
  }
}
