// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordModel _$RecordModelFromJson(Map<String, dynamic> json) {
  return _RecordModel.fromJson(json);
}

/// @nodoc
mixin _$RecordModel {
  int? get id => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get kmCount => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get rate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordModelCopyWith<RecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordModelCopyWith<$Res> {
  factory $RecordModelCopyWith(
          RecordModel value, $Res Function(RecordModel) then) =
      _$RecordModelCopyWithImpl<$Res, RecordModel>;
  @useResult
  $Res call(
      {int? id,
      DateTime? createdAt,
      DateTime date,
      String userId,
      int kmCount,
      double price,
      double quantity,
      double rate});
}

/// @nodoc
class _$RecordModelCopyWithImpl<$Res, $Val extends RecordModel>
    implements $RecordModelCopyWith<$Res> {
  _$RecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? date = null,
    Object? userId = null,
    Object? kmCount = null,
    Object? price = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      kmCount: null == kmCount
          ? _value.kmCount
          : kmCount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordModelImplCopyWith<$Res>
    implements $RecordModelCopyWith<$Res> {
  factory _$$RecordModelImplCopyWith(
          _$RecordModelImpl value, $Res Function(_$RecordModelImpl) then) =
      __$$RecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      DateTime? createdAt,
      DateTime date,
      String userId,
      int kmCount,
      double price,
      double quantity,
      double rate});
}

/// @nodoc
class __$$RecordModelImplCopyWithImpl<$Res>
    extends _$RecordModelCopyWithImpl<$Res, _$RecordModelImpl>
    implements _$$RecordModelImplCopyWith<$Res> {
  __$$RecordModelImplCopyWithImpl(
      _$RecordModelImpl _value, $Res Function(_$RecordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? date = null,
    Object? userId = null,
    Object? kmCount = null,
    Object? price = null,
    Object? quantity = null,
    Object? rate = null,
  }) {
    return _then(_$RecordModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      kmCount: null == kmCount
          ? _value.kmCount
          : kmCount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordModelImpl implements _RecordModel {
  const _$RecordModelImpl(
      {this.id,
      this.createdAt,
      required this.date,
      required this.userId,
      required this.kmCount,
      required this.price,
      required this.quantity,
      required this.rate});

  factory _$RecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordModelImplFromJson(json);

  @override
  final int? id;
  @override
  final DateTime? createdAt;
  @override
  final DateTime date;
  @override
  final String userId;
  @override
  final int kmCount;
  @override
  final double price;
  @override
  final double quantity;
  @override
  final double rate;

  @override
  String toString() {
    return 'RecordModel(id: $id, createdAt: $createdAt, date: $date, userId: $userId, kmCount: $kmCount, price: $price, quantity: $quantity, rate: $rate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.kmCount, kmCount) || other.kmCount == kmCount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.rate, rate) || other.rate == rate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, date, userId, kmCount, price, quantity, rate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordModelImplCopyWith<_$RecordModelImpl> get copyWith =>
      __$$RecordModelImplCopyWithImpl<_$RecordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordModelImplToJson(
      this,
    );
  }
}

abstract class _RecordModel implements RecordModel {
  const factory _RecordModel(
      {final int? id,
      final DateTime? createdAt,
      required final DateTime date,
      required final String userId,
      required final int kmCount,
      required final double price,
      required final double quantity,
      required final double rate}) = _$RecordModelImpl;

  factory _RecordModel.fromJson(Map<String, dynamic> json) =
      _$RecordModelImpl.fromJson;

  @override
  int? get id;
  @override
  DateTime? get createdAt;
  @override
  DateTime get date;
  @override
  String get userId;
  @override
  int get kmCount;
  @override
  double get price;
  @override
  double get quantity;
  @override
  double get rate;
  @override
  @JsonKey(ignore: true)
  _$$RecordModelImplCopyWith<_$RecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
