// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FoodItem _$$_FoodItemFromJson(Map<String, dynamic> json) => _$_FoodItem(
      id: json['id'] as String,
      name: json['name'] as String,
      stockStatus: json['stockStatus'] as bool,
      dietType: $enumDecode(_$DietTypeEnumMap, json['dietType']),
    );

Map<String, dynamic> _$$_FoodItemToJson(_$_FoodItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'stockStatus': instance.stockStatus,
      'dietType': _$DietTypeEnumMap[instance.dietType]!,
    };

const _$DietTypeEnumMap = {
  DietType.vegetarian: 'vegetarian',
  DietType.nonVegetarian: 'nonVegetarian',
  DietType.eggetarian: 'eggetarian',
};
