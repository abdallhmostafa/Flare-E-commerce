import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare/data/product/model/color_model.dart';
import 'package:flare/domain/product/product_entity/product_entity.dart';

class ProductModel {
  final String? categoryId;
  final List<Color>? colors;
  final Timestamp? createdDate;
  final double? discountedPrice;
  final int? gender;
  final double? price;
  final String? productId;
  final int? salesNumber;
  final String? title;
  final List<String>? sizes;
  final List<String>? images;

  ProductModel({
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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors?.map((color) => color.toJson()).toList() ?? [],
      'createdDate': createdDate ?? Timestamp.now(),
      'discountedPrice': discountedPrice ?? 0.0,
      'gender': gender ?? 1,
      'price': price ?? 0.0,
      'productId': productId ?? '',
      'salesNumber': salesNumber ?? 0,
      'title': title ?? '',
      'sizes': sizes?.map((size) => size).toList() ?? [],
      'images': images?.map((image) => image).toList() ?? [],
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categoryId: json['categoryId'],
      colors: json['colors'] != null
          ? (json['colors'] as List)
              .map((color) => Color.fromJson(color))
              .toList()
          : [],
      createdDate: json['createdDate'] ?? Timestamp.now(),
      discountedPrice: json['discountedPrice'] ?? 0,
      gender: json['gender'] ?? 1,
      price: json['price'] ?? 0.0,
      productId: json['productId'] ?? '',
      salesNumber: json['salesNumber'] ?? 0,
      title: json['title'],
      sizes: json['sizes'] != null
          ? (json['sizes'] as List).map((size) => size.toString()).toList()
          : [],
      images: json['images'] != null
          ? (json['images'] as List).map((image) => image.toString()).toList()
          : [],
    );
  }
}

extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId ?? '',
      colors: colors?.map((color) => color.toEntity()).toList() ?? [],
      createdDate: createdDate ?? Timestamp.now(),
      discountedPrice: discountedPrice ?? 0,
      gender: gender ?? 1,
      price: price ?? 0,
      productId: productId ?? '',
      salesNumber: salesNumber ?? 0,
      title: title ?? '',
      sizes: sizes?.map((size) => size).toList() ?? [],
      images: images?.map((image) => image).toList() ?? [],
    );
  }
}
