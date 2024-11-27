import 'package:dartz/dartz.dart';
import 'package:flare/app_service_locator.dart';
import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/data/order/model/order_model_request.dart';
import 'package:flare/data/order/model/order_registration_req.dart';
import 'package:flare/data/order/model/ordered_products_model.dart';
import 'package:flare/data/order/model/product_ordered_model.dart';
import 'package:flare/data/order/source/order_firebase_service_repo.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';
import 'package:flare/domain/order/repository/order_domain_repository.dart';

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

  @override
  Future<Either<Left, List<ProductOrderedEntity>>> getCartProducts() async {
    final response = await AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .getCartProducts();
    return response.fold(
      (failure) => left(failure),
      (success) => right(List.from(success)
          .map((e) => ProductOrderedModel.fromJson(e).toEntity())
          .toList()),
    );
  }

  @override
  Future<Either<dynamic, String>> removeCartProducts(
      {required String id}) async {
    final response = await AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .removeCartProducts(id: id);
    return response.fold(
      (failure) => left(failure),
      (successMessage) => right(successMessage),
    );
  }

  @override
  Future<Either> removeAllOrderedProduct(
      {required List<ProductOrderedEntity> orderedProducts}) async {
    final response = await AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .removeAllOrderedProduct(orderedProducts: orderedProducts);
    return response.fold(
      (failure) => left(failure),
      (successMessage) => right(successMessage),
    );
  }

  @override
  Future<Either> addDeliveryAddress(
      {required DeliveryAddressModel deliveryAddressModel}) async {
    final response = await AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .addDeliveryAddress(deliveryAddressModel: deliveryAddressModel);
    return response.fold(
      (failure) => left(failure),
      (successMessage) => right(successMessage),
    );
  }

  @override
  Future<Either> orderRegistration(
      {required OrderRegistrationReq orderedProducts}) async {
    final response = await AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .orderRegistration(orderedProducts: orderedProducts);
    return response.fold(
      (failure) => left(failure),
      (successMessage) => right(successMessage),
    );
  }

  @override
  Future<Either> getOrderedProducts() async {
    final response = await AppServiceLocator.getIt<OrderFirebaseServiceRepo>()
        .getOrderedProducts();
    return response.fold(
      (failure) => left(failure),
      (orderedProducts) => right(orderedProducts
          .map((e) => OrderedProductsModel.fromMap(e).toEntity())
          .toList()),
    );
  }
}
