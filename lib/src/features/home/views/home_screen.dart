import 'package:flutter/material.dart';
import 'package:petroleum/src/features/records/widgets/petrol_record_widget.dart';
import 'package:petroleum/src/ui/widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        titleText: 'Petroleum',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: ListView(
          children: [
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
            // PetrolRecordTile(),
          ],
        ),
      ),
    );
  }
}
