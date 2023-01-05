import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import 'food_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@Freezed()
class Order with _$Order {
  const factory Order({
    required String id,
    required DonorInstituition donorInstituition,
    required ReceiverInstituition receiverInstituition,
    required List<FoodItem> foodItems,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  factory Order.raw(DonorInstituition donorInstituition,
      ReceiverInstituition receiverInstituition) {
    Uuid uuid = Uuid();
    return Order(
      id: uuid.v1(),
      donorInstituition: donorInstituition,
      receiverInstituition: receiverInstituition,
      foodItems: [],
    );
  }
}
