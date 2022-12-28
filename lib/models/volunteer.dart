import 'package:freezed_annotation/freezed_annotation.dart';

part 'volunteer.freezed.dart';
part 'volunteer.g.dart';

@Freezed()
class Volunteer with _$Volunteer {
  const factory Volunteer({
    required String id,
    required String name,
    required String emailAddress,
  }) = _Volunteer;

  factory Volunteer.fromJson(Map<String, dynamic> json) =>
      _$VolunteerFromJson(json);
}
