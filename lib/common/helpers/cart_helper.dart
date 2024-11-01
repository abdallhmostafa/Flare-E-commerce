import 'package:flare/domain/order/entities/product_ordered_entity.dart';

class CartHelper {
  static double calculateSubTotalPrice(List<ProductOrderedEntity> products) {
    double totalPrice = 0;
    for (ProductOrderedEntity product in products) {
      totalPrice += product.productPrice;
    }
    return totalPrice;
  }

  static double calculateTotalPrice(List<ProductOrderedEntity> products) {
    double totalPrice = 0;
    totalPrice = calculateSubTotalPrice(products) + 8 + 0;
    return totalPrice;
  }
}
