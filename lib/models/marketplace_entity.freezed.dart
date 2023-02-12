// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketplace_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarketplaceEntity _$MarketplaceEntityFromJson(Map<String, dynamic> json) {
  return _MarketplaceEntity.fromJson(json);
}

/// @nodoc
mixin _$MarketplaceEntity {
  String get id => throw _privateConstructorUsedError;
  DonorInstituition get donorInstituition => throw _privateConstructorUsedError;
  List<FoodItem> get foodItems => throw _privateConstructorUsedError;
  bool get isOpen => throw _privateConstructorUsedError;
  bool get isListed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketplaceEntityCopyWith<MarketplaceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketplaceEntityCopyWith<$Res> {
  factory $MarketplaceEntityCopyWith(
          MarketplaceEntity value, $Res Function(MarketplaceEntity) then) =
      _$MarketplaceEntityCopyWithImpl<$Res, MarketplaceEntity>;
  @useResult
  $Res call(
      {String id,
      DonorInstituition donorInstituition,
      List<FoodItem> foodItems,
      bool isOpen,
      bool isListed});

  $DonorInstituitionCopyWith<$Res> get donorInstituition;
}

/// @nodoc
class _$MarketplaceEntityCopyWithImpl<$Res, $Val extends MarketplaceEntity>
    implements $MarketplaceEntityCopyWith<$Res> {
  _$MarketplaceEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? donorInstituition = null,
    Object? foodItems = null,
    Object? isOpen = null,
    Object? isListed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      donorInstituition: null == donorInstituition
          ? _value.donorInstituition
          : donorInstituition // ignore: cast_nullable_to_non_nullable
              as DonorInstituition,
      foodItems: null == foodItems
          ? _value.foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isListed: null == isListed
          ? _value.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DonorInstituitionCopyWith<$Res> get donorInstituition {
    return $DonorInstituitionCopyWith<$Res>(_value.donorInstituition, (value) {
      return _then(_value.copyWith(donorInstituition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MarketplaceEntityCopyWith<$Res>
    implements $MarketplaceEntityCopyWith<$Res> {
  factory _$$_MarketplaceEntityCopyWith(_$_MarketplaceEntity value,
          $Res Function(_$_MarketplaceEntity) then) =
      __$$_MarketplaceEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DonorInstituition donorInstituition,
      List<FoodItem> foodItems,
      bool isOpen,
      bool isListed});

  @override
  $DonorInstituitionCopyWith<$Res> get donorInstituition;
}

/// @nodoc
class __$$_MarketplaceEntityCopyWithImpl<$Res>
    extends _$MarketplaceEntityCopyWithImpl<$Res, _$_MarketplaceEntity>
    implements _$$_MarketplaceEntityCopyWith<$Res> {
  __$$_MarketplaceEntityCopyWithImpl(
      _$_MarketplaceEntity _value, $Res Function(_$_MarketplaceEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? donorInstituition = null,
    Object? foodItems = null,
    Object? isOpen = null,
    Object? isListed = null,
  }) {
    return _then(_$_MarketplaceEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      donorInstituition: null == donorInstituition
          ? _value.donorInstituition
          : donorInstituition // ignore: cast_nullable_to_non_nullable
              as DonorInstituition,
      foodItems: null == foodItems
          ? _value._foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isListed: null == isListed
          ? _value.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarketplaceEntity implements _MarketplaceEntity {
  const _$_MarketplaceEntity(
      {required this.id,
      required this.donorInstituition,
      required final List<FoodItem> foodItems,
      required this.isOpen,
      required this.isListed})
      : _foodItems = foodItems;

  factory _$_MarketplaceEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MarketplaceEntityFromJson(json);

  @override
  final String id;
  @override
  final DonorInstituition donorInstituition;
  final List<FoodItem> _foodItems;
  @override
  List<FoodItem> get foodItems {
    if (_foodItems is EqualUnmodifiableListView) return _foodItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodItems);
  }

  @override
  final bool isOpen;
  @override
  final bool isListed;

  @override
  String toString() {
    return 'MarketplaceEntity(id: $id, donorInstituition: $donorInstituition, foodItems: $foodItems, isOpen: $isOpen, isListed: $isListed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketplaceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.donorInstituition, donorInstituition) ||
                other.donorInstituition == donorInstituition) &&
            const DeepCollectionEquality()
                .equals(other._foodItems, _foodItems) &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isListed, isListed) ||
                other.isListed == isListed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, donorInstituition,
      const DeepCollectionEquality().hash(_foodItems), isOpen, isListed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarketplaceEntityCopyWith<_$_MarketplaceEntity> get copyWith =>
      __$$_MarketplaceEntityCopyWithImpl<_$_MarketplaceEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarketplaceEntityToJson(
      this,
    );
  }
}

abstract class _MarketplaceEntity implements MarketplaceEntity {
  const factory _MarketplaceEntity(
      {required final String id,
      required final DonorInstituition donorInstituition,
      required final List<FoodItem> foodItems,
      required final bool isOpen,
      required final bool isListed}) = _$_MarketplaceEntity;

  factory _MarketplaceEntity.fromJson(Map<String, dynamic> json) =
      _$_MarketplaceEntity.fromJson;

  @override
  String get id;
  @override
  DonorInstituition get donorInstituition;
  @override
  List<FoodItem> get foodItems;
  @override
  bool get isOpen;
  @override
  bool get isListed;
  @override
  @JsonKey(ignore: true)
  _$$_MarketplaceEntityCopyWith<_$_MarketplaceEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
