import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petroleum/src/features/records/controllers/records_controller.dart';
import 'package:petroleum/src/features/records/widgets/petrol_record_widget.dart';
import 'package:petroleum/src/ui/widgets/appbar.dart';
import 'package:petroleum/src/ui/widgets/bottomNavbar.dart';

class RecordsPage extends ConsumerWidget {
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(recordsControllerProvider);
    return Scaffold(
      appBar: customAppBar(
        context,
        titleText: "Records",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: controller.when(
          data: (data) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return PetrolRecordTile(model: data[index]);
              },
              itemCount: controller.value?.length,
            );
          },
          error: (error, stack) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const FloatingBottomNavbar(currentIndex: 1),
    );
  }
}
