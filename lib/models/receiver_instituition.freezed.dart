// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receiver_instituition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiverInstituition _$ReceiverInstituitionFromJson(Map<String, dynamic> json) {
  return _ReceiverInstituition.fromJson(json);
}

/// @nodoc
mixin _$ReceiverInstituition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get emailAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiverInstituitionCopyWith<ReceiverInstituition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiverInstituitionCopyWith<$Res> {
  factory $ReceiverInstituitionCopyWith(ReceiverInstituition value,
          $Res Function(ReceiverInstituition) then) =
      _$ReceiverInstituitionCopyWithImpl<$Res, ReceiverInstituition>;
  @useResult
  $Res call({String id, String name, String emailAddress});
}

/// @nodoc
class _$ReceiverInstituitionCopyWithImpl<$Res,
        $Val extends ReceiverInstituition>
    implements $ReceiverInstituitionCopyWith<$Res> {
  _$ReceiverInstituitionCopyWithImpl(this._value, this._then);

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
abstract class _$$_ReceiverInstituitionCopyWith<$Res>
    implements $ReceiverInstituitionCopyWith<$Res> {
  factory _$$_ReceiverInstituitionCopyWith(_$_ReceiverInstituition value,
          $Res Function(_$_ReceiverInstituition) then) =
      __$$_ReceiverInstituitionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String emailAddress});
}

/// @nodoc
class __$$_ReceiverInstituitionCopyWithImpl<$Res>
    extends _$ReceiverInstituitionCopyWithImpl<$Res, _$_ReceiverInstituition>
    implements _$$_ReceiverInstituitionCopyWith<$Res> {
  __$$_ReceiverInstituitionCopyWithImpl(_$_ReceiverInstituition _value,
      $Res Function(_$_ReceiverInstituition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emailAddress = null,
  }) {
    return _then(_$_ReceiverInstituition(
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
class _$_ReceiverInstituition implements _ReceiverInstituition {
  const _$_ReceiverInstituition(
      {required this.id, required this.name, required this.emailAddress});

  factory _$_ReceiverInstituition.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiverInstituitionFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String emailAddress;

  @override
  String toString() {
    return 'ReceiverInstituition(id: $id, name: $name, emailAddress: $emailAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiverInstituition &&
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
  _$$_ReceiverInstituitionCopyWith<_$_ReceiverInstituition> get copyWith =>
      __$$_ReceiverInstituitionCopyWithImpl<_$_ReceiverInstituition>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiverInstituitionToJson(
      this,
    );
  }
}

abstract class _ReceiverInstituition implements ReceiverInstituition {
  const factory _ReceiverInstituition(
      {required final String id,
      required final String name,
      required final String emailAddress}) = _$_ReceiverInstituition;

  factory _ReceiverInstituition.fromJson(Map<String, dynamic> json) =
      _$_ReceiverInstituition.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get emailAddress;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiverInstituitionCopyWith<_$_ReceiverInstituition> get copyWith =>
      throw _privateConstructorUsedError;
}
