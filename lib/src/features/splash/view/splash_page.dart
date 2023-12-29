import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:petroleum/src/core/providers/supabase.dart';
import 'package:petroleum/src/core/routes/router.dart';
import 'package:petroleum/src/features/profile/controllers/profile_controller.dart';
import 'package:petroleum/src/features/profile/models/profile_model.dart';
import 'package:petroleum/src/ui/colors.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  redirect() async {
    await Future.delayed(Duration.zero);
    if (mounted) {
      final supa = ref.watch(supabaseProvider);

      final session = supa.auth.currentSession;
      if (session != null) {
        Logger().i("Logged in");
        final profile =
            await ref.read(profileControllerProvider).getUserProfile();
        if (mounted) {
          if (profile == null) {
            GoRouter.of(context).go(AppRoutes.completeProfile);
          } else if (profile.isComplete) {
            GoRouter.of(context).go(AppRoutes.home);
          } else {
            GoRouter.of(context).go(AppRoutes.completeProfile);
          }
        }
      } else {
        GoRouter.of(context).go(AppRoutes.login);
      }
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1503669678209-c68d00b3765d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          // child: Spink,
          child: SpinKitWave(
            size: 100,
            color: AppColors.periwinkle,
          ),
          //      child: SpinKitDualRing(
          // size: 100,
          //        color: AppColors.periwinkle,
          //      ),
        ),
      ),
    );
  }
}
