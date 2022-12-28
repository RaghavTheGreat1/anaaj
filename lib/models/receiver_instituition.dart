import 'package:freezed_annotation/freezed_annotation.dart';

part 'receiver_instituition.freezed.dart';
part 'receiver_instituition.g.dart';

@Freezed()
class ReceiverInstituition with _$ReceiverInstituition {
  const factory ReceiverInstituition({
    required String id,
    required String name,
    required String emailAddress,
  }) = _ReceiverInstituition;

  factory ReceiverInstituition.fromJson(Map<String, dynamic> json) =>
      _$ReceiverInstituitionFromJson(json);
}
