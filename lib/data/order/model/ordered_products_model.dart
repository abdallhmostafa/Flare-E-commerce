import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/data/order/model/product_ordered_model.dart';
import 'package:flare/domain/order/entities/ordered_products_entity.dart';

class OrderedProductsModel extends OrderedProductsEntity {
  OrderedProductsModel(
      {required super.orderedProducts,
      required super.deliveryAddress,
      required super.createdAt,
      required super.count,
      required super.totalPrice});

  factory OrderedProductsModel.fromMap(Map<String, dynamic> map) {
    return OrderedProductsModel(
      orderedProducts: (map['orderedProducts'] as List)
          .map((e) => ProductOrderedModel.fromJson(e))
          .toList(),
      deliveryAddress: DeliveryAddressModel.fromJson(map['deliveryAddress']),
      createdAt: map['createdAt'] as String,
      count: map['count'] as int,
      totalPrice: map['totalPrice'] as double,
    );
  }
}

extension OrderedProductsModelX on OrderedProductsModel {
OrderedProductsEntity toEntity() {
    return OrderedProductsEntity(
      orderedProducts: orderedProducts,
      deliveryAddress: deliveryAddress,
      createdAt: createdAt,
      count: count,
      totalPrice: totalPrice,
    );
  }
}
