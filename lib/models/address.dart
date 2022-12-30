import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@Freezed()
class Address with _$Address {
  const factory Address({
    required String id,
    required String streetAddress,
    required String city,
    required String state,
    required String country,
    required String pincode,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
