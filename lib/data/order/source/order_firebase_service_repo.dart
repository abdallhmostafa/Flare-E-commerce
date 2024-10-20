import 'package:dartz/dartz.dart';
import 'package:flare/data/order/model/order_model_request.dart';

abstract class OrderFirebaseServiceRepo {
  Future<Either> addToCart({required OrderModelRequest orderModelRequest});

}