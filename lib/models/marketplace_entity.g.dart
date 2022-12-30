// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarketplaceEntity _$$_MarketplaceEntityFromJson(Map<String, dynamic> json) =>
    _$_MarketplaceEntity(
      id: json['id'] as String,
      donorInstituition: DonorInstituition.fromJson(
          json['donorInstituition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MarketplaceEntityToJson(
        _$_MarketplaceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'donorInstituition': instance.donorInstituition.toJson(),
    };
