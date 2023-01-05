import 'package:anaaj/models/donor_instituition.dart';
import 'package:anaaj/models/receiver_instituition.dart';
import 'package:anaaj/models/volunteer.dart';
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
    required Volunteer volunteer,
    required ReceiverInstituition receiverInstituition,
    required DateTime submissionDateTime,
    required List<FoodItem> foodItems,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  factory Order.raw(DonorInstituition donorInstituition, Volunteer volunteer,
      ReceiverInstituition receiverInstituition) {
    Uuid uuid = Uuid();
    return Order(
      id: uuid.v1(),
      donorInstituition: donorInstituition,
      submissionDateTime: DateTime.now(),
      volunteer: volunteer,
      receiverInstituition: receiverInstituition,
      foodItems: [],
    );
  }
}
