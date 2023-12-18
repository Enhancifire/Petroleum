import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:petroleum/src/core/routes/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_controller.g.dart';

// class AuthController {
//   final AuthControllerRef ref;
//
//   AuthController(this.ref);
//
//   bool isLoading = false;
//
//   loginWithEmailAndPassword(
//     BuildContext context, {
//     required String email,
//     required String password,
//   }) async {
//     final client = ref.read(supabaseProvider);
//
//     isLoading = true;
//
//     try {
//       final res = await client.auth.signInWithPassword(
//         password: password,
//         email: email,
//       );
//
//       isLoading = false;
//     } on AuthException catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(e.message),
//           ),
//         );
//
//         isLoading = false;
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(e.toString()),
//           ),
//         );
//       }
//       isLoading = false;
//     }
//   }
// }
//
// @riverpod
// AuthController authController(AuthControllerRef ref) {
//   return AuthController(ref);
// }

@riverpod
class AuthController extends _$AuthController {
  @override
  bool build() {
    return false;
  }

  loginWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final client = ref.read(supabaseProvider);

    state = true;

    try {
      final res = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );

      state = false;
    } on AuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );

        state = false;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
      state = false;
    }
  }

  registerWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    final client = ref.read(supabaseProvider);

    state = true;

    try {
      final res = await client.auth.signUp(
        email: email,
        password: password,
      );

      if (res.user != null) {
        if (context.mounted) {
          GoRouter.of(context).go(AppRoutes.home);
        }
      }

      state = false;
    } on AuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.message),
          ),
        );

        state = false;
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
          ),
        );
      }
      state = false;
    }
  }
}
