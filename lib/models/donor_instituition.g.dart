// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'donor_instituition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DonorInstituition _$$_DonorInstituitionFromJson(Map<String, dynamic> json) =>
    _$_DonorInstituition(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as int,
      emailAddress: json['emailAddress'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DonorInstituitionToJson(
        _$_DonorInstituition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'emailAddress': instance.emailAddress,
      'address': instance.address.toJson(),
    };
