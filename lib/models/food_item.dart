import 'package:anaaj/models/diet_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

@Freezed()
class FoodItem with _$FoodItem {
  const factory FoodItem({
    required String id,
    required String name,
    required bool stockStatus,
    required DietType dietType,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) =>
      _$FoodItemFromJson(json);

  factory FoodItem.raw() {
    Uuid uuid = Uuid();
    return FoodItem(
      id: uuid.v1(),
      name: '',
      stockStatus: true,
      dietType: DietType.vegetarian,
    );
  }
}
