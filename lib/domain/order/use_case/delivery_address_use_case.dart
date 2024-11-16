import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/domain/order/repository/order_domain_repository.dart';

class DeliveryAddressUseCase implements UseCase<Either, DeliveryAddressModel> {
  @override
  Future<Either> call({DeliveryAddressModel? params}) {
    return AppServiceLocator.getIt<OrderDomainRepository>()
        .addDeliveryAddress(deliveryAddressModel: params!);
  }
}
