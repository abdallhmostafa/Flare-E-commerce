import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare/domain/product/product_entity/color_entity.dart';

class ProductEntity {
  final String categoryId;
  final List<ColorEntity> colors;
  final Timestamp createdDate;
  final double discountedPrice;
  final int gender;
  final double price;
  final String productId;
  final int salesNumber;
  final String title;
  final List<String> sizes;
  final List<String> images;

  ProductEntity({
    required this.categoryId,
    required this.colors,
    required this.createdDate,
    required this.discountedPrice,
    required this.gender,
    required this.price,
    required this.productId,
    required this.salesNumber,
    required this.title,
    required this.sizes,
    required this.images,
  });
}
