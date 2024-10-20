import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/data/order/source/order_firebase_service_repo.dart';
import 'package:flare/domain/order/order_domain_repository.dart';

class OrderRepoImpl implements OrderDomainRepository {
  @override
  Future<Either> addToCart(
      {required OrderModelRequest orderModelRequest}) async {
    final response = await AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .addToCart(orderModelRequest: orderModelRequest);
    return response.fold(
      (failure) => left(failure),
      (success) => right(success),
    );
  }
}
