import 'package:flutter/material.dart';
import 'package:petroleum/src/features/records/widgets/petrol_record_widget.dart';
import 'package:petroleum/src/ui/widgets/appbar.dart';
import 'package:petroleum/src/ui/widgets/bottomNavbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        titleText: 'Petroleum',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        // child: Expanded(
        //   child: Container(),
        // ),
      ),
      extendBody: true,
      bottomNavigationBar: FloatingBottomNavbar(currentIndex: 0),
    );
  }
}
