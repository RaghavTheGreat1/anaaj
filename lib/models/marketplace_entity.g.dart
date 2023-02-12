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
      foodItems: (json['foodItems'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      isOpen: json['isOpen'] as bool,
      isListed: json['isListed'] as bool,
    );

Map<String, dynamic> _$$_MarketplaceEntityToJson(
        _$_MarketplaceEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'donorInstituition': instance.donorInstituition.toJson(),
      'foodItems': instance.foodItems.map((e) => e.toJson()).toList(),
      'isOpen': instance.isOpen,
      'isListed': instance.isListed,
    };
