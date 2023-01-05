// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$$_OrderFromJson(Map<String, dynamic> json) => _$_Order(
      id: json['id'] as String,
      donorInstituition: DonorInstituition.fromJson(
          json['donorInstituition'] as Map<String, dynamic>),
      volunteer: Volunteer.fromJson(json['volunteer'] as Map<String, dynamic>),
      receiverInstituition: ReceiverInstituition.fromJson(
          json['receiverInstituition'] as Map<String, dynamic>),
      submissionDateTime: DateTime.parse(json['submissionDateTime'] as String),
      foodItems: (json['foodItems'] as List<dynamic>)
          .map((e) => FoodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'donorInstituition': instance.donorInstituition.toJson(),
      'volunteer': instance.volunteer.toJson(),
      'receiverInstituition': instance.receiverInstituition.toJson(),
      'submissionDateTime': instance.submissionDateTime.toIso8601String(),
      'foodItems': instance.foodItems.map((e) => e.toJson()).toList(),
    };
