import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/data/order/model/product_ordered_model.dart';
import 'package:flare/domain/order/entities/delivery_address_entity.dart';
import 'package:flare/domain/order/entities/product_ordered_entity.dart';

class OrderRegistrationReq {
  final List<ProductOrderedEntity> orderedProducts;
  final DeliveryAddressEntity deliveryAddress;
  final String createdAt;
  final int count;
  final double totalPrice;

  OrderRegistrationReq(
      {required this.orderedProducts,
      required this.deliveryAddress,
      required this.createdAt,
      required this.count,
      required this.totalPrice});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderedProducts': orderedProducts.map((x) => x.fromEntity().toJson()).toList(),
      'deliveryAddress': deliveryAddress.fromEntity().toJson(),
      'createdAt': createdAt,
      'count': count,
      'totalPrice': totalPrice,
    };
  }

  factory OrderRegistrationReq.fromMap(Map<String, dynamic> map) {
    return OrderRegistrationReq(
      orderedProducts: List<ProductOrderedEntity>.from(map['orderedProducts']
          .map((x) => ProductOrderedModel.fromJson(x).toEntity())),
      deliveryAddress: DeliveryAddressModel.fromJson(map).toEntity(),
      createdAt: map['createdAt'] as String,
      count: map['count'] as int,
      totalPrice: map['totalPrice'] as double,
    );
  }
}
