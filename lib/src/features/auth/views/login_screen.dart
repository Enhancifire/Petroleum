import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:petroleum/src/core/routes/router.dart';
import 'package:petroleum/src/core/utils/size_utils.dart';
import 'package:petroleum/src/features/auth/controllers/auth_controller.dart';
import 'package:petroleum/src/ui/colors.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;

  String? emailErrorText;
  String? passwordErrorText;

  @override
  void initState() {
    super.initState();
  }

  login() {
    final authController = ref.read(authControllerProvider.notifier);
    if (emailController.text.isEmpty) {
      setState(() {
        emailErrorText = "Please enter an email";
        passwordErrorText = null;
      });
      return;
    }
    if (passwordController.text.isEmpty) {
      setState(() {
        emailErrorText = null;
        passwordErrorText = "Please enter a password";
      });
      return;
    }
    authController.loginWithEmailAndPassword(
      context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authController = ref.watch(authControllerProvider);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            // "https://images.unsplash.com/photo-1702659610398-58d3fb3f65f2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHx8",
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
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        labelText: "Password",
                        filled: false,
                        errorText: passwordErrorText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                          icon: Icon(
                            isObscure ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                    ),
                    // addVerticalSpace(heightValue(context, 6)),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: Text(
                          "Forgot password?",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.periwinkle,
                                  ),
                        ),
                      ),
                    ),
                    addVerticalSpace(heightValue(context, 12)),
                    ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                    addVerticalSpace(heightValue(context, 20)),
                    Row(
                      children: [
                        Text(
                          "No account? ",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go(AppRoutes.register);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            "Create one!",
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
          if (authController)
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
