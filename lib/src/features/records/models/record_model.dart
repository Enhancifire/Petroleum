import 'package:freezed_annotation/freezed_annotation.dart';

part 'record_model.freezed.dart';

part 'record_model.g.dart';

@freezed
class RecordModel with _$RecordModel {
  const factory RecordModel({
    int? id,
    DateTime? createdAt,
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

extension RecordUtils on RecordModel {
  Map<String, dynamic> toExtJson() {
    final map = {
      "date": date.toIso8601String(),
      "userId": userId,
      "kmCount": kmCount,
      "price": price,
      "quantity": quantity,
      "rate": rate,
    };

    if (createdAt != null) {
      map["createdAt"] = createdAt!;
    }

    if (id != null) {
      map["id"] = id!;
    }

    return map;
  }
}
