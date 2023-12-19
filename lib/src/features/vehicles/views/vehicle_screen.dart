import 'package:flutter/material.dart';
import 'package:petroleum/src/features/vehicles/widgets/vehicle_glass_tile.dart';
import 'package:petroleum/src/ui/widgets/appbar.dart';
import 'package:petroleum/src/ui/widgets/bottomNavbar.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            // "https://images.unsplash.com/photo-1496147539180-13929f8aa03a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            "https://images.unsplash.com/photo-1532298229144-0ec0c57515c7?q=80&w=2022&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: customAppBar(
          context,
          titleText: "Vehicles",
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: ListView(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: VehicleGlassyTile(),
              ),
            ],
          ),
        ),
        extendBody: true,
        bottomNavigationBar: FloatingBottomNavbar(currentIndex: 2),
      ),
    );
  }
}
