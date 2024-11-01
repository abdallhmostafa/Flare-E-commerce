import 'package:dartz/dartz.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';

abstract class OrderDomainRepository {
  Future<Either> addToCart({required OrderModelRequest orderModelRequest});
  Future<Either> removeCartProducts({required String id});
  Future<Either> removeAllOrderedProduct(
      {required List<ProductOrderedEntity> orderedProducts});
  Future<Either<Left, List<ProductOrderedEntity>>> getCartProducts();
}
