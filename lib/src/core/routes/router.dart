import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:petroleum/src/features/extra/views/coming_soon_page.dart';
import 'package:petroleum/src/features/home/views/home_screen.dart';
import 'package:petroleum/src/features/records/views/records_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

class AppRoutes {
  AppRoutes._();

  static const String root = records;

  // Auth
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String forgotPassword = "/auth/forgot-password";
  static const String verifyOTP = "/auth/verify-otp";

  // Home
  static const String home = "/home";

  // Vehicle
  static const String vehicles = "/vehicles";

  // Records
  static const String records = "/records";
}

@riverpod
GoRouter router(RouterRef ref) {
  // final supabase = ref.watch(supabaseProvider);
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref
    ..onDispose(isAuth.dispose)
    ..listen(supabaseProvider, (previous, next) {
      isAuth.value = AsyncValue.data(next.auth.currentSession != null);
    });
  final router = GoRouter(
      refreshListenable: isAuth,
      initialLocation: AppRoutes.root,
      routes: [
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: AppRoutes.vehicles,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
            path: AppRoutes.records,
            builder: (context, state) {
              return const RecordsPage();
            }),
      ],
      redirect: (context, state) {
        return null;
      });

  ref.onDispose(router.dispose);

  return router;
}
