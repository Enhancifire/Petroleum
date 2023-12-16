import 'package:flutter/material.dart';
import 'package:petroleum/src/ui/colors.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RichText(
          text: TextSpan(
            text: "Stay Tuned!",
            style: Theme.of(context).textTheme.headlineLarge,
            children: [
              TextSpan(
                text: " Coming Soon",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(color: AppColors.periwinkle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
