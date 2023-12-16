import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petroleum/src/core/initializer/initializer.dart';
import 'package:petroleum/src/petroleum.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.initialize();
  runApp(
    const ProviderScope(
      child: Petroleum(),
    ),
  );
}
