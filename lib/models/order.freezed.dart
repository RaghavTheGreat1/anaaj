// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  DonorInstituition get donorInstituition => throw _privateConstructorUsedError;
  Volunteer get volunteer => throw _privateConstructorUsedError;
  OrderStatus get orderStatus => throw _privateConstructorUsedError;
  ReceiverInstituition get receiverInstituition =>
      throw _privateConstructorUsedError;
  DateTime get submissionDateTime => throw _privateConstructorUsedError;
  List<FoodItem> get foodItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      DonorInstituition donorInstituition,
      Volunteer volunteer,
      OrderStatus orderStatus,
      ReceiverInstituition receiverInstituition,
      DateTime submissionDateTime,
      List<FoodItem> foodItems});

  $DonorInstituitionCopyWith<$Res> get donorInstituition;
  $VolunteerCopyWith<$Res> get volunteer;
  $ReceiverInstituitionCopyWith<$Res> get receiverInstituition;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? donorInstituition = null,
    Object? volunteer = null,
    Object? orderStatus = null,
    Object? receiverInstituition = null,
    Object? submissionDateTime = null,
    Object? foodItems = null,
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
      volunteer: null == volunteer
          ? _value.volunteer
          : volunteer // ignore: cast_nullable_to_non_nullable
              as Volunteer,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      receiverInstituition: null == receiverInstituition
          ? _value.receiverInstituition
          : receiverInstituition // ignore: cast_nullable_to_non_nullable
              as ReceiverInstituition,
      submissionDateTime: null == submissionDateTime
          ? _value.submissionDateTime
          : submissionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      foodItems: null == foodItems
          ? _value.foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DonorInstituitionCopyWith<$Res> get donorInstituition {
    return $DonorInstituitionCopyWith<$Res>(_value.donorInstituition, (value) {
      return _then(_value.copyWith(donorInstituition: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $VolunteerCopyWith<$Res> get volunteer {
    return $VolunteerCopyWith<$Res>(_value.volunteer, (value) {
      return _then(_value.copyWith(volunteer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiverInstituitionCopyWith<$Res> get receiverInstituition {
    return $ReceiverInstituitionCopyWith<$Res>(_value.receiverInstituition,
        (value) {
      return _then(_value.copyWith(receiverInstituition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$_OrderCopyWith(_$_Order value, $Res Function(_$_Order) then) =
      __$$_OrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DonorInstituition donorInstituition,
      Volunteer volunteer,
      OrderStatus orderStatus,
      ReceiverInstituition receiverInstituition,
      DateTime submissionDateTime,
      List<FoodItem> foodItems});

  @override
  $DonorInstituitionCopyWith<$Res> get donorInstituition;
  @override
  $VolunteerCopyWith<$Res> get volunteer;
  @override
  $ReceiverInstituitionCopyWith<$Res> get receiverInstituition;
}

/// @nodoc
class __$$_OrderCopyWithImpl<$Res> extends _$OrderCopyWithImpl<$Res, _$_Order>
    implements _$$_OrderCopyWith<$Res> {
  __$$_OrderCopyWithImpl(_$_Order _value, $Res Function(_$_Order) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? donorInstituition = null,
    Object? volunteer = null,
    Object? orderStatus = null,
    Object? receiverInstituition = null,
    Object? submissionDateTime = null,
    Object? foodItems = null,
  }) {
    return _then(_$_Order(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      donorInstituition: null == donorInstituition
          ? _value.donorInstituition
          : donorInstituition // ignore: cast_nullable_to_non_nullable
              as DonorInstituition,
      volunteer: null == volunteer
          ? _value.volunteer
          : volunteer // ignore: cast_nullable_to_non_nullable
              as Volunteer,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      receiverInstituition: null == receiverInstituition
          ? _value.receiverInstituition
          : receiverInstituition // ignore: cast_nullable_to_non_nullable
              as ReceiverInstituition,
      submissionDateTime: null == submissionDateTime
          ? _value.submissionDateTime
          : submissionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      foodItems: null == foodItems
          ? _value._foodItems
          : foodItems // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Order implements _Order {
  const _$_Order(
      {required this.id,
      required this.donorInstituition,
      required this.volunteer,
      required this.orderStatus,
      required this.receiverInstituition,
      required this.submissionDateTime,
      required final List<FoodItem> foodItems})
      : _foodItems = foodItems;

  factory _$_Order.fromJson(Map<String, dynamic> json) =>
      _$$_OrderFromJson(json);

  @override
  final String id;
  @override
  final DonorInstituition donorInstituition;
  @override
  final Volunteer volunteer;
  @override
  final OrderStatus orderStatus;
  @override
  final ReceiverInstituition receiverInstituition;
  @override
  final DateTime submissionDateTime;
  final List<FoodItem> _foodItems;
  @override
  List<FoodItem> get foodItems {
    if (_foodItems is EqualUnmodifiableListView) return _foodItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodItems);
  }

  @override
  String toString() {
    return 'Order(id: $id, donorInstituition: $donorInstituition, volunteer: $volunteer, orderStatus: $orderStatus, receiverInstituition: $receiverInstituition, submissionDateTime: $submissionDateTime, foodItems: $foodItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Order &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.donorInstituition, donorInstituition) ||
                other.donorInstituition == donorInstituition) &&
            (identical(other.volunteer, volunteer) ||
                other.volunteer == volunteer) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.receiverInstituition, receiverInstituition) ||
                other.receiverInstituition == receiverInstituition) &&
            (identical(other.submissionDateTime, submissionDateTime) ||
                other.submissionDateTime == submissionDateTime) &&
            const DeepCollectionEquality()
                .equals(other._foodItems, _foodItems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      donorInstituition,
      volunteer,
      orderStatus,
      receiverInstituition,
      submissionDateTime,
      const DeepCollectionEquality().hash(_foodItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      __$$_OrderCopyWithImpl<_$_Order>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final DonorInstituition donorInstituition,
      required final Volunteer volunteer,
      required final OrderStatus orderStatus,
      required final ReceiverInstituition receiverInstituition,
      required final DateTime submissionDateTime,
      required final List<FoodItem> foodItems}) = _$_Order;

  factory _Order.fromJson(Map<String, dynamic> json) = _$_Order.fromJson;

  @override
  String get id;
  @override
  DonorInstituition get donorInstituition;
  @override
  Volunteer get volunteer;
  @override
  OrderStatus get orderStatus;
  @override
  ReceiverInstituition get receiverInstituition;
  @override
  DateTime get submissionDateTime;
  @override
  List<FoodItem> get foodItems;
  @override
  @JsonKey(ignore: true)
  _$$_OrderCopyWith<_$_Order> get copyWith =>
      throw _privateConstructorUsedError;
}
