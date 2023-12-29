import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:petroleum/src/features/auth/views/login_screen.dart';
import 'package:petroleum/src/features/auth/views/register_screen.dart';
import 'package:petroleum/src/features/extra/views/404_not_found_page.dart';
import 'package:petroleum/src/features/extra/views/coming_soon_page.dart';
import 'package:petroleum/src/features/home/views/home_screen.dart';
import 'package:petroleum/src/features/profile/controllers/profile_controller.dart';
import 'package:petroleum/src/features/profile/models/profile_model.dart';
import 'package:petroleum/src/features/profile/views/complete_profile_screen.dart';
import 'package:petroleum/src/features/records/views/add_record_page.dart';
import 'package:petroleum/src/features/records/views/records_page.dart';
import 'package:petroleum/src/features/splash/view/splash_page.dart';
import 'package:petroleum/src/features/vehicles/views/vehicle_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

class AppRoutes {
  AppRoutes._();

  static const String root = "/";

  // Auth
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String forgotPassword = "/auth/forgot-password";
  static const String verifyOTP = "/auth/verify-otp";

  static const List<String> authRoutes = [
    login,
    register,
    forgotPassword,
    verifyOTP,
  ];

  static const String completeProfile = "/complete-profile";

  // Home
  static const String home = "/home";

  // Vehicle
  static const String vehicles = "/vehicles";

  // Records
  static const String records = "/records";

  //Profile
  static const String profile = "/profile";

  static const String addRecord = "/add-record";
}

@riverpod
GoRouter router(RouterRef ref) {
  // final supabase = ref.watch(supabaseProvider);
  final auth = ref.watch(supabaseProvider).auth;
  final isAuth = ValueNotifier<AsyncValue<bool>>(const AsyncLoading());
  ref.onDispose(isAuth.dispose);
  // ..listen(supabaseProvider, (previous, next) {
  //   isAuth.value = AsyncValue.data(next.auth.currentSession != null);
  // });
  auth.onAuthStateChange.listen((event) {
    final session = event.session;
    isAuth.value = AsyncValue.data(session != null);
  });
  final router = GoRouter(
    refreshListenable: isAuth,
    initialLocation: AppRoutes.root,
    routes: [
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
          path: AppRoutes.login,
          builder: (context, state) {
            return const LoginScreen();
          }),
      GoRoute(
          path: AppRoutes.register,
          builder: (context, state) {
            return const RegisterScreen();
          }),
      GoRoute(
          path: AppRoutes.completeProfile,
          builder: (context, state) {
            return const CompleteProfileScreen();
          }),
      GoRoute(
          path: AppRoutes.home,
          builder: (context, state) {
            return const HomePage();
          }),
      GoRoute(
          path: AppRoutes.records,
          builder: (context, state) {
            return const RecordsPage();
          }),
      GoRoute(
          path: AppRoutes.vehicles,
          builder: (context, state) {
            return const VehicleScreen();
          }),
      GoRoute(
          path: AppRoutes.profile,
          builder: (context, state) {
            return const ComingSoonPage();
          }),
      GoRoute(
          path: AppRoutes.addRecord,
          builder: (context, state) {
            return const AddRecordPage();
          }),
    ],
    redirect: (context, state) {
      final profileController = ref.read(profileControllerProvider);
      final currentLoc = state.path;

      if (AppRoutes.authRoutes.contains(currentLoc)) {
        return null;
      }

      if (profileController.profile != null) {
        if (!profileController.profile!.isComplete) {
          if (currentLoc == AppRoutes.completeProfile) {
            return null;
          }
          return AppRoutes.completeProfile;
        }
      }
      return null;
    },
    errorBuilder: (context, state) {
      return const NotFoundPage();
    },
  );

  ref.onDispose(router.dispose);

  return router;
}
