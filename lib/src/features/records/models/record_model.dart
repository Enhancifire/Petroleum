import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.freezed.dart';

part 'record_model.g.dart';

@freezed
class RecordModel with _$RecordModel {
  const factory RecordModel({
    required int id,
    required DateTime createdAt,
    required DateTime date,
    required String userId,
    required int kmCount,
    required double price,
    required double quantity,
    required double rate,
  }) = _RecordModel;

  factory RecordModel.fromJson(Map<String, dynamic> json) =>
      _$RecordModelFromJson(json);
}
