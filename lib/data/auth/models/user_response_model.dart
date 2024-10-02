import 'dart:convert';

import 'package:flare/domain/auth/entity/user_response_entity.dart';

class  UserResponseModel {
  final String firstName;
  final String lastName;
  final String email;
  final String? image;
  final String age;
  final String userId;
  final int gender;

  UserResponseModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.image,
    required this.age,
    required this.userId,
    required this.gender,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'image': image,
      'age': age,
      'userId': userId,
      'gender': gender
    };
  }

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromMap(Map<String, dynamic> json) {
    return UserResponseModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      image: json['image'] ?? "",
      age: json['age'] as String,
      userId: json['userId'] as String? ?? "",
      gender: json['gender'] as int,
    );
  }
  factory UserResponseModel.fromJson(String jsonString) =>
      UserResponseModel.fromMap(
          json.decode(jsonString) as Map<String, dynamic>);
}

extension UserResponseModelX on UserResponseModel {
  UserResponseEntity toEntity() {
    return UserResponseEntity(
        firstName: firstName,
        lastName: lastName,
        email: email,
        image: image ?? "",
        age: age,
        userId: userId,
        gender: gender);
  }
}
              