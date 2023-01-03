import 'package:anaaj/models/donor_instituition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'marketplace_entity.freezed.dart';
part 'marketplace_entity.g.dart';

@Freezed()
class MarketplaceEntity with _$MarketplaceEntity {
  const factory MarketplaceEntity({
    required String id,
    required DonorInstituition donorInstituition,
    // required List<FoodItem> foodItem,
  }) = _MarketplaceEntity;
  
  factory MarketplaceEntity.fromJson(Map<String, dynamic> json) =>
      _$MarketplaceEntityFromJson(json);
}
