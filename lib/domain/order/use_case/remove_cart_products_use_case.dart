import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/order/repository/order_domain_repository.dart';

class RemoveCartProductsUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return AppServiceLocator.getIt<OrderDomainRepository>()
        .removeCartProducts(id: params!);
  }
}
