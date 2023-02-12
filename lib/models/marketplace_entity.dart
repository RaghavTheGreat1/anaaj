import 'package:anaaj/models/donor_instituition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'food_item.dart';

import 'food_item.dart';

part 'marketplace_entity.freezed.dart';
part 'marketplace_entity.g.dart';

@Freezed()
class MarketplaceEntity with _$MarketplaceEntity {
  const factory MarketplaceEntity({
    required String id,
    required DonorInstituition donorInstituition,
    required List<FoodItem> foodItems,
    required bool isOpen,
    required bool isListed,
  }) = _MarketplaceEntity;

  factory MarketplaceEntity.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceEntityFromJson(json);

  factory MarketplaceEntity.raw(DonorInstituition donorInstituition) {
    Uuid uuid = Uuid();
    return MarketplaceEntity(
      id: uuid.v1(),
      donorInstituition: donorInstituition,
      foodItems: [],
      isOpen: true,
      isListed: true,
    );
  }
}
