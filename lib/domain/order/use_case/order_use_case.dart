import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/domain/order/repository/order_domain_repository.dart';

class AddOrderUseCase implements UseCase<Either, OrderModelRequest> {
  @override
  Future<Either> call({OrderModelRequest? params}) {
    return AppServiceLocator.getIt<OrderDomainRepository>()
        .addToCart(orderModelRequest: params!);
  }
}
