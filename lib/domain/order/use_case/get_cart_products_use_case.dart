import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/domain/order/repository/order_domain_repository.dart';

class GetCartProductsUseCase implements UseCase<Either,dynamic > {
  @override
  Future<Either> call({params}) {
    return AppServiceLocator.getIt<OrderDomainRepository>()
        .getCartProducts();
  }
}
