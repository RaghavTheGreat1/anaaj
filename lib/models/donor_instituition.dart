import 'package:anaaj/models/address.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'donor_instituition.freezed.dart';
part 'donor_instituition.g.dart';

@Freezed()
class DonorInstituition with _$DonorInstituition {
  const factory DonorInstituition({
    required String id,
    required String name,
    required int phoneNumber,
    required String emailAddress,
    required Address address,
  }) = _DonorInstituition;

  factory DonorInstituition.fromJson(Map<String, dynamic> json) =>
      _$DonorInstituitionFromJson(json);
}
