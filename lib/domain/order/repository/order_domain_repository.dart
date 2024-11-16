import 'package:dartz/dartz.dart';
import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/data/order/model/order_registration_req.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';

abstract class OrderDomainRepository {
  Future<Either> addToCart({required OrderModelRequest orderModelRequest});
  Future<Either> addDeliveryAddress(
      {required DeliveryAddressModel deliveryAddressModel});
  Future<Either> removeCartProducts({required String id});
  Future<Either> removeAllOrderedProduct(
      {required List<ProductOrderedEntity> orderedProducts});
  Future<Either<Left, List<ProductOrderedEntity>>> getCartProducts();
  Future<Either> orderRegistration(
      {required OrderRegistrationReq orderedProducts});

}
