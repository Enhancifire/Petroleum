import 'package:logger/logger.dart';
import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:petroleum/src/features/records/models/record_model.dart';
import 'package:petroleum/src/features/records/repositories/records_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'records_controller.g.dart';

@riverpod
class RecordsController extends _$RecordsController {
  final logger = Logger();

  @override
  Future<List<RecordModel>> build() async {
    final recordRepo = ref.read(recordsRepositoryProvider);
    final res = await recordRepo.getRecords();
    return res;
  }

  refreshData() async {
    state = const AsyncValue.loading();
    final recordRepo = ref.read(recordsRepositoryProvider);
    final res = await recordRepo.getRecords();
    state = AsyncValue.data(res);
  }

  Future<RecordModel?> addRecord({
    required String kmCount,
    required String price,
    required String quantity,
    required DateTime date,
  }) async {
    final supabase = ref.read(supabaseProvider);
    final userId = supabase.auth.currentUser!.id;
    final rate = double.parse(quantity) / double.parse(price);

    final model = RecordModel(
      date: date,
      userId: userId,
      kmCount: int.parse(kmCount),
      price: double.parse(price),
      quantity: double.parse(quantity),
      rate: rate,
    );
    final recordRepo = ref.read(recordsRepositoryProvider);
    final res = await recordRepo.addRecord(model);

    return res;
  }
}
