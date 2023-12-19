import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:petroleum/src/core/utils/size_utils.dart';

class VehicleGlassyTile extends StatelessWidget {
  const VehicleGlassyTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      // height: heightValue(context, 300),
      height: double.maxFinite,
      width: double.maxFinite,
      borderRadius: 20,
      linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFffffff).withOpacity(0.2),
            const Color(0xFFFFFFFF).withOpacity(0.1),
          ],
          stops: const [
            0.1,
            1,
          ]),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFFFFFFF).withOpacity(0.5),
          const Color(0xFFFFFFFF).withOpacity(0.5),
        ],
      ),
      blur: 20,
      border: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widthValue(context, 24),
          vertical: heightValue(context, 24),
        ),
        child: Column(
	crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Avenger"),
            Text("Type: Bike"),
          ],
        ),
      ),
      // child: SizedBox(
      //   width: double.maxFinite,
      //   height: 500,
      // ),
    );
  }
}
