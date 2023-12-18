import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petroleum/src/core/constants/supabase_constants.dart';
import 'package:petroleum/src/features/profile/controllers/profile_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Initializer {
  Initializer._();

  static Future<void> initialize() async {
    await _initializeSupabase();
    await _initializeProfile();
  }

  static Future<void> _initializeSupabase() async {
    await Supabase.initialize(
      url: SupabaseConstants.url,
      anonKey: SupabaseConstants.key,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );
  }

  static Future<void> _initializeProfile() async {
    // final riverpodContainer = ProviderContainer();
    // final profileController =
    //     riverpodContainer.read(profileControllerProvider.notifier);
    // await profileController.getUserProfile();
  }
}
