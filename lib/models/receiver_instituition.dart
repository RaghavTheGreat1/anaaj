import 'package:anaaj/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receiver_instituition.freezed.dart';
part 'receiver_instituition.g.dart';

@Freezed()
class ReceiverInstituition with _$ReceiverInstituition {
  const factory ReceiverInstituition({
    required String id,
    required String name,
    required int phoneNumber,
    required String emailAddress,
    required Address address,
    required String? fcmToken,
    required bool acceptingOrders,
  }) = _ReceiverInstituition;

  factory ReceiverInstituition.fromJson(Map<String, dynamic> json) =>
      _$ReceiverInstituitionFromJson(json);
}
