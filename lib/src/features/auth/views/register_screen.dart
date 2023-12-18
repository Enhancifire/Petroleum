import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petroleum/src/core/routes/router.dart';
import 'package:petroleum/src/core/utils/size_utils.dart';
import 'package:petroleum/src/features/auth/controllers/auth_controller.dart';
import 'package:petroleum/src/ui/colors.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends ConsumerState<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isObscured = true;
  bool isConfirmObscured = true;

  String? emailErrorText;
  String? passwordErrorText;
  String? confirmErrorText;

  Timer? emailDebounceTimer;
  Timer? passwordDebounceTimer;

  @override
  void initState() {
    super.initState();
  }

  register() {
    final authController = ref.read(authControllerProvider.notifier);
    if (emailController.text.isEmpty) {
      setState(() {
        emailErrorText = "Please enter an email";
        passwordErrorText = null;
        confirmErrorText = null;
      });
      return;
    }
    if (passwordController.text.isEmpty) {
      setState(() {
        emailErrorText = null;
        passwordErrorText = "Please enter a password";
        confirmErrorText = null;
      });
      return;
    }
    if (confirmPasswordController.text.isEmpty) {
      setState(() {
        emailErrorText = null;
        passwordErrorText = null;
        confirmErrorText = "Please confirm your password";
      });
      return;
    }
    if (confirmPasswordController.text != passwordController.text) {
      setState(() {
        emailErrorText = null;
        passwordErrorText = null;
        confirmErrorText = "Passwords do not match";
      });
      return;
    }
    setState(() {
      emailErrorText = null;
      passwordErrorText = null;
      confirmErrorText = null;
    });
    authController.registerWithEmailAndPassword(
      context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAuthLoading = ref.watch(authControllerProvider);
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
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widthValue(context, 24),
                  vertical: heightValue(context, 16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Petroleum",
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    addVerticalSpace(heightValue(context, 24)),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: false,
                        errorText: emailErrorText,
                      ),
                    ),
                    addVerticalSpace(heightValue(context, 12)),
                    TextField(
                      controller: passwordController,
                      obscureText: isObscured,
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: false,
                        errorText: passwordErrorText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    addVerticalSpace(heightValue(context, 12)),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: isConfirmObscured,
                      decoration: InputDecoration(
                        labelText: "Confirm password",
                        filled: false,
                        errorText: confirmErrorText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isConfirmObscured = !isConfirmObscured;
                            });
                          },
                          icon: Icon(
                            isConfirmObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    // addVerticalSpace(heightValue(context, 6)),
                    addVerticalSpace(heightValue(context, 20)),
                    ElevatedButton(
                      onPressed: register,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    addVerticalSpace(heightValue(context, 20)),
                    Row(
                      children: [
                        Text(
                          "Have an account?",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go(AppRoutes.login);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            "Login",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppColors.periwinkle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isAuthLoading)
            Container(
              decoration: const BoxDecoration(
                color: Colors.white12,
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
