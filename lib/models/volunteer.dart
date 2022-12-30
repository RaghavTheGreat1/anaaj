import 'package:anaaj/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer.freezed.dart';
part 'volunteer.g.dart';

@Freezed()
class Volunteer with _$Volunteer {
  const factory Volunteer({
    required String id,
    required String name,
    required int phoneNumber,
    required String emailAddress,
    required Address address,
  }) = _Volunteer;

  factory Volunteer.fromJson(Map<String, dynamic> json) =>
      _$VolunteerFromJson(json);
}