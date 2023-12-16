import 'package:logger/logger.dart';
import 'package:petroleum/src/core/constants/supabase_constants.dart';
import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:petroleum/src/features/records/models/record_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'records_repository.g.dart';

class RecordsRepository {
  final SupabaseClient supabase;
  RecordsRepository({required this.supabase});

  final _logger = Logger();

  Future<List<RecordModel>> getRecords() async {
    final res = await supabase.from(SupabaseConstants.recordsTable).select("*");
    if (res.isEmpty) {
      _logger.i("No records found");
    }
    final List<RecordModel> records = [];
    for (var record in res) {
      _logger.i(record);
      records.add(RecordModel.fromJson(record));
    }

    return records;
  }
}

@riverpod
RecordsRepository recordsRepository(ref) {
  final supabase = ref.watch(supabaseProvider);
  return RecordsRepository(supabase: supabase);
}
