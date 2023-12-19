import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petroleum/src/core/initializer/initializer.dart';
import 'package:petroleum/src/petroleum.dart';

Future<void> main() async {
  final container = ProviderContainer();
  WidgetsFlutterBinding.ensureInitialized();
  await container.read(initializerProvider);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const Petroleum(),
    ),
  );
}
