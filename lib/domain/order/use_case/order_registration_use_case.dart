import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/data/order/model/order_registration_req.dart';
import 'package:flare/domain/order/repository/order_domain_repository.dart';

class OrderRegistrationUseCase implements UseCase<Either, OrderRegistrationReq> {
  @override
  Future<Either> call({OrderRegistrationReq? params}) {
    return AppServiceLocator.getIt<OrderDomainRepository>()
        .orderRegistration(orderedProducts: params!);
  }
}
