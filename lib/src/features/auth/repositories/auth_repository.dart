import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final AuthRepositoryRef ref;
  final SupabaseClient client;
  AuthRepository(
    this.ref, {
    required this.client,
  });

  loginWithEmailAndPassword(String email, String password) async {
    try {
      final res = await client.auth.signInWithPassword(
        email: email,
        password: password,
      );
    } on AuthException catch (e) {
    } catch (e) {}
  }

  registerWithEmailAndPassword(String email, String password) async {
    try {
      final res = await client.auth.signUp(
        email: email,
        password: password,
      );
    } catch (e) {}
  }
}

@riverpod
AuthRepository authRepository(ref) {
  final client = ref.watch(supabaseProvider);
  return AuthRepository(
    ref,
    client: client,
  );
}
