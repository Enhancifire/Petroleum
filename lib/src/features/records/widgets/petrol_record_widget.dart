import 'package:flutter/material.dart';
import 'package:petroleum/src/features/records/models/record_model.dart';

class PetrolRecordTile extends StatelessWidget {
  const PetrolRecordTile({super.key, required this.model});

  final RecordModel model;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(model.kmCount.toString()),
      subtitle: Text("${model.quantity}L"),
      trailing: Text(model.price.roundToDouble().toString()),
    );
  }
}
