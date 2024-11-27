import 'package:flare/data/order/model/delivery_address_model.dart';
import 'package:flare/data/order/model/product_ordered_model.dart';

class OrderedProductsEntity {
  final List<ProductOrderedModel> orderedProducts;
  final DeliveryAddressModel deliveryAddress;
  final String createdAt;
  final int count;
  final double totalPrice;

  OrderedProductsEntity(
      {required this.orderedProducts,
      required this.deliveryAddress,
      required this.createdAt,
      required this.count,
      required this.totalPrice});
}
