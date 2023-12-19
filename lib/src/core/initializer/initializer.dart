import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petroleum/src/core/constants/supabase_constants.dart';
import 'package:petroleum/src/features/profile/controllers/profile_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Initializer {
  Initializer._();

  static Future<void> initialize(Ref ref) async {
    await _initializeSupabase();
    final supabase = Supabase.instance.client;
    if (supabase.auth.currentSession != null) {
      await _initializeProfile(ref);
    }
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

  static Future<void> _initializeProfile(Ref ref) async {
    final profileController = ref.read(profileControllerProvider);
    await profileController.getUserProfile();
  }
}

final initializerProvider = Provider((ref) async {
  await Initializer.initialize(ref);
});
