import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/product/product_repository/product_domain_repository.dart';

class GetNewInItemsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) {
    return AppServiceLocator.getIt<ProductDomainRepository>().getNewInItems();
  }
}
