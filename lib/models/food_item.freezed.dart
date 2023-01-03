// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return _FoodItem.fromJson(json);
}

/// @nodoc
mixin _$FoodItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get stockStatus => throw _privateConstructorUsedError;
  DietType get dietType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res, FoodItem>;
  @useResult
  $Res call({String id, String name, bool stockStatus, DietType dietType});
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res, $Val extends FoodItem>
    implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stockStatus = null,
    Object? dietType = null,
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
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      dietType: null == dietType
          ? _value.dietType
          : dietType // ignore: cast_nullable_to_non_nullable
              as DietType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FoodItemCopyWith<$Res> implements $FoodItemCopyWith<$Res> {
  factory _$$_FoodItemCopyWith(
          _$_FoodItem value, $Res Function(_$_FoodItem) then) =
      __$$_FoodItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, bool stockStatus, DietType dietType});
}

/// @nodoc
class __$$_FoodItemCopyWithImpl<$Res>
    extends _$FoodItemCopyWithImpl<$Res, _$_FoodItem>
    implements _$$_FoodItemCopyWith<$Res> {
  __$$_FoodItemCopyWithImpl(
      _$_FoodItem _value, $Res Function(_$_FoodItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? stockStatus = null,
    Object? dietType = null,
  }) {
    return _then(_$_FoodItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      stockStatus: null == stockStatus
          ? _value.stockStatus
          : stockStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      dietType: null == dietType
          ? _value.dietType
          : dietType // ignore: cast_nullable_to_non_nullable
              as DietType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FoodItem implements _FoodItem {
  const _$_FoodItem(
      {required this.id,
      required this.name,
      required this.stockStatus,
      required this.dietType});

  factory _$_FoodItem.fromJson(Map<String, dynamic> json) =>
      _$$_FoodItemFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool stockStatus;
  @override
  final DietType dietType;

  @override
  String toString() {
    return 'FoodItem(id: $id, name: $name, stockStatus: $stockStatus, dietType: $dietType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoodItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.stockStatus, stockStatus) ||
                other.stockStatus == stockStatus) &&
            (identical(other.dietType, dietType) ||
                other.dietType == dietType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, stockStatus, dietType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodItemCopyWith<_$_FoodItem> get copyWith =>
      __$$_FoodItemCopyWithImpl<_$_FoodItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodItemToJson(
      this,
    );
  }
}

abstract class _FoodItem implements FoodItem {
  const factory _FoodItem(
      {required final String id,
      required final String name,
      required final bool stockStatus,
      required final DietType dietType}) = _$_FoodItem;

  factory _FoodItem.fromJson(Map<String, dynamic> json) = _$_FoodItem.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get stockStatus;
  @override
  DietType get dietType;
  @override
  @JsonKey(ignore: true)
  _$$_FoodItemCopyWith<_$_FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}
