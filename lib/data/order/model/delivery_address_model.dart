import 'package:flare/domain/order/entities/delivery_address_entity.dart';

class DeliveryAddressModel  {
final String streetAddress;
  final String city;
  final String state;
  final String zipCode;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      'zipCode': zipCode,
    };
  }

  factory DeliveryAddressModel.fromJson(Map<String, dynamic> map) {
    return DeliveryAddressModel(
      streetAddress: map['streetAddress'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zipCode: map['zipCode'] as String,
    );
  }

  DeliveryAddressModel({required this.streetAddress, required this.city, required this.state, required this.zipCode});
}

extension DeliveryAddressModelExtension on DeliveryAddressModel {
  DeliveryAddressEntity toEntity() {
    return DeliveryAddressEntity(
      streetAddress: streetAddress,
      city: city,
      state: state,
      zipCode: zipCode,
    );
  }
}
extension DeliveryAddressModelEntity on DeliveryAddressEntity {
  DeliveryAddressModel fromEntity() {
    return DeliveryAddressModel(
      streetAddress: streetAddress,
      city: city,
      state: state,
      zipCode: zipCode,
    );
  }
}
