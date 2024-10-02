import 'dart:convert';

import 'package:flare/domain/category/category_entity/category_entity.dart';

class CategoryModel {
  final String categoryId;
  final String? image;
  final String? title;

  CategoryModel({
    required this.categoryId,
    required this.image,
    required this.title,
  });

  Map<String, dynamic> toMap() => {
        'categoryId': categoryId,
        'image': image,
        'title': title,
      };

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
    );
  } 

  String toJson() => json.encode(toMap());
  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(
        json.decode(source),
      );
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() => CategoryEntity(
        categoryId: categoryId,
        image: image ?? '',
        title: title ?? '',
      );
}
