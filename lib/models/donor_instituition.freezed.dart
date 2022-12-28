// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'donor_instituition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DonorInstituition _$DonorInstituitionFromJson(Map<String, dynamic> json) {
  return _DonorInstituition.fromJson(json);
}

/// @nodoc
mixin _$DonorInstituition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DonorInstituitionCopyWith<DonorInstituition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DonorInstituitionCopyWith<$Res> {
  factory $DonorInstituitionCopyWith(
          DonorInstituition value, $Res Function(DonorInstituition) then) =
      _$DonorInstituitionCopyWithImpl<$Res, DonorInstituition>;
  @useResult
  $Res call({String id, String name, String emailAddress});
}

/// @nodoc
class _$DonorInstituitionCopyWithImpl<$Res, $Val extends DonorInstituition>
    implements $DonorInstituitionCopyWith<$Res> {
  _$DonorInstituitionCopyWithImpl(this._value, this._then);

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
abstract class _$$_DonorInstituitionCopyWith<$Res>
    implements $DonorInstituitionCopyWith<$Res> {
  factory _$$_DonorInstituitionCopyWith(_$_DonorInstituition value,
          $Res Function(_$_DonorInstituition) then) =
      __$$_DonorInstituitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String emailAddress});
}

/// @nodoc
class __$$_DonorInstituitionCopyWithImpl<$Res>
    extends _$DonorInstituitionCopyWithImpl<$Res, _$_DonorInstituition>
    implements _$$_DonorInstituitionCopyWith<$Res> {
  __$$_DonorInstituitionCopyWithImpl(
      _$_DonorInstituition _value, $Res Function(_$_DonorInstituition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emailAddress = null,
  }) {
    return _then(_$_DonorInstituition(
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
class _$_DonorInstituition implements _DonorInstituition {
  const _$_DonorInstituition(
      {required this.id, required this.name, required this.emailAddress});

  factory _$_DonorInstituition.fromJson(Map<String, dynamic> json) =>
      _$$_DonorInstituitionFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String emailAddress;

  @override
  String toString() {
    return 'DonorInstituition(id: $id, name: $name, emailAddress: $emailAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DonorInstituition &&
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
  _$$_DonorInstituitionCopyWith<_$_DonorInstituition> get copyWith =>
      __$$_DonorInstituitionCopyWithImpl<_$_DonorInstituition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DonorInstituitionToJson(
      this,
    );
  }
}

abstract class _DonorInstituition implements DonorInstituition {
  const factory _DonorInstituition(
      {required final String id,
      required final String name,
      required final String emailAddress}) = _$_DonorInstituition;

  factory _DonorInstituition.fromJson(Map<String, dynamic> json) =
      _$_DonorInstituition.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get emailAddress;
  @override
  @JsonKey(ignore: true)
  _$$_DonorInstituitionCopyWith<_$_DonorInstituition> get copyWith =>
      throw _privateConstructorUsedError;
}
