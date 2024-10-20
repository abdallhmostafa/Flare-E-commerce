import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/core/usecase/usecase.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/data/order/source/order_firebase_service_repo.dart';

class AddOrderUseCase implements UseCase<Either, OrderModelRequest> {
  @override
  Future<Either> call({OrderModelRequest? params}) {
    return AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .addToCart(orderModelRequest: params!);
  }
}
