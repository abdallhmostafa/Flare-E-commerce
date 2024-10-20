import 'package:dartz/dartz.dart';
import 'package:flare/data/order/model/order_model_request.dart';

abstract class OrderDomainRepository {
  Future<Either> addToCart({required OrderModelRequest orderModelRequest});
}
