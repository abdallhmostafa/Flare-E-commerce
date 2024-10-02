import 'package:flare/domain/product/product_entity/color_entity.dart';

class Color {
  final String? title;
  final String? hexCode;

  Color({required this.title, required this.hexCode});
  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      title: json['title'],
      hexCode: json['hexCode'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'hexCode': hexCode,
    };
  }
}

extension ColorX on Color {
  ColorEntity toEntity() {
    return ColorEntity(
      title: title ?? '',
      hexCode: hexCode ?? '',
    );
  }
}