// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'volunteer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Volunteer _$VolunteerFromJson(Map<String, dynamic> json) {
  return _Volunteer.fromJson(json);
}

/// @nodoc
mixin _$Volunteer {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get phoneNumber => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VolunteerCopyWith<Volunteer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VolunteerCopyWith<$Res> {
  factory $VolunteerCopyWith(Volunteer value, $Res Function(Volunteer) then) =
      _$VolunteerCopyWithImpl<$Res, Volunteer>;
  @useResult
  $Res call(
      {String id,
      String name,
      int phoneNumber,
      String emailAddress,
      Address address});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$VolunteerCopyWithImpl<$Res, $Val extends Volunteer>
    implements $VolunteerCopyWith<$Res> {
  _$VolunteerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? emailAddress = null,
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VolunteerCopyWith<$Res> implements $VolunteerCopyWith<$Res> {
  factory _$$_VolunteerCopyWith(
          _$_Volunteer value, $Res Function(_$_Volunteer) then) =
      __$$_VolunteerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      int phoneNumber,
      String emailAddress,
      Address address});

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$_VolunteerCopyWithImpl<$Res>
    extends _$VolunteerCopyWithImpl<$Res, _$_Volunteer>
    implements _$$_VolunteerCopyWith<$Res> {
  __$$_VolunteerCopyWithImpl(
      _$_Volunteer _value, $Res Function(_$_Volunteer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? emailAddress = null,
    Object? address = null,
  }) {
    return _then(_$_Volunteer(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as int,
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Volunteer implements _Volunteer {
  const _$_Volunteer(
      {required this.id,
      required this.name,
      required this.phoneNumber,
      required this.emailAddress,
      required this.address});

  factory _$_Volunteer.fromJson(Map<String, dynamic> json) =>
      _$$_VolunteerFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int phoneNumber;
  @override
  final String emailAddress;
  @override
  final Address address;

  @override
  String toString() {
    return 'Volunteer(id: $id, name: $name, phoneNumber: $phoneNumber, emailAddress: $emailAddress, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Volunteer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, phoneNumber, emailAddress, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VolunteerCopyWith<_$_Volunteer> get copyWith =>
      __$$_VolunteerCopyWithImpl<_$_Volunteer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VolunteerToJson(
      this,
    );
  }
}

abstract class _Volunteer implements Volunteer {
  const factory _Volunteer(
      {required final String id,
      required final String name,
      required final int phoneNumber,
      required final String emailAddress,
      required final Address address}) = _$_Volunteer;

  factory _Volunteer.fromJson(Map<String, dynamic> json) =
      _$_Volunteer.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get phoneNumber;
  @override
  String get emailAddress;
  @override
  Address get address;
  @override
  @JsonKey(ignore: true)
  _$$_VolunteerCopyWith<_$_Volunteer> get copyWith =>
      throw _privateConstructorUsedError;
}
