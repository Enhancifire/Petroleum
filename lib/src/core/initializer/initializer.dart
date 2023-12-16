import 'package:petroleum/src/core/constants/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Initializer {
  Initializer._();

  static Future<void> initialize() async {
    await _initializeSupabase();
  }

  static Future<void> _initializeSupabase() async {
    await Supabase.initialize(
      url: SupabaseConstants.url,
      anonKey: SupabaseConstants.key,
    );
  }
}
