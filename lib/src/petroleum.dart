import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petroleum/src/core/routes/router.dart';
import 'package:petroleum/src/ui/theme.dart';

class Petroleum extends ConsumerWidget {
  const Petroleum({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      title: "Petroleum",
      darkTheme: appTheme(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
