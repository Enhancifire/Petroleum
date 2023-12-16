// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordModelImpl _$$RecordModelImplFromJson(Map<String, dynamic> json) =>
    _$RecordModelImpl(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      date: DateTime.parse(json['date'] as String),
      userId: json['userId'] as String,
      kmCount: json['kmCount'] as int,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$RecordModelImplToJson(_$RecordModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'userId': instance.userId,
      'kmCount': instance.kmCount,
      'price': instance.price,
      'quantity': instance.quantity,
      'rate': instance.rate,
    };
