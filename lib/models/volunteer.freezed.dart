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
  String get emailAddress => throw _privateConstructorUsedError;

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
  $Res call({String id, String name, String emailAddress});
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
    Object? emailAddress = null,
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
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VolunteerCopyWith<$Res> implements $VolunteerCopyWith<$Res> {
  factory _$$_VolunteerCopyWith(
          _$_Volunteer value, $Res Function(_$_Volunteer) then) =
      __$$_VolunteerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String emailAddress});
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
    Object? emailAddress = null,
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
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Volunteer implements _Volunteer {
  const _$_Volunteer(
      {required this.id, required this.name, required this.emailAddress});

  factory _$_Volunteer.fromJson(Map<String, dynamic> json) =>
      _$$_VolunteerFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String emailAddress;

  @override
  String toString() {
    return 'Volunteer(id: $id, name: $name, emailAddress: $emailAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Volunteer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, emailAddress);

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
      required final String emailAddress}) = _$_Volunteer;

  factory _Volunteer.fromJson(Map<String, dynamic> json) =
      _$_Volunteer.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get emailAddress;
  @override
  @JsonKey(ignore: true)
  _$$_VolunteerCopyWith<_$_Volunteer> get copyWith =>
      throw _privateConstructorUsedError;
}
