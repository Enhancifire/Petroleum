import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:petroleum/src/core/utils/size_utils.dart';
import 'package:petroleum/src/ui/colors.dart';
import 'package:petroleum/src/ui/theme.dart';

// class FloatingBottomNavbar extends StatelessWidget {
//   const FloatingBottomNavbar({super.key, required this.currentIndex});
//
//   final int currentIndex;
//
//   @override
//   Widget build(BuildContext context) {
//     return DotNavigationBar(
//       enableFloatingNavBar: true,
//       borderRadius: borderRadius,
//       backgroundColor: AppColors.periwinkle,
//       selectedItemColor: AppColors.bgColor,
//       // unselectedItemColor: Color(0xFF182A3A),
//       unselectedItemColor: Colors.black38,
//       items: [
//         DotNavigationBarItem(
//           icon: Icon(Icons.home),
//         ),
//         DotNavigationBarItem(
//           icon: Icon(Icons.list),
//         ),
//         DotNavigationBarItem(
//           icon: Icon(Icons.add),
//         ),
//         DotNavigationBarItem(
//           icon: Icon(Icons.motorcycle),
//         ),
//         DotNavigationBarItem(
//           icon: Icon(Icons.person),
//         ),
//       ],
//       currentIndex: currentIndex,
//       onTap: (index) {
//         // navShell.goBranch(index);
//       },
//     );
//   }
// }

class FloatingBottomNavbar extends StatelessWidget {
  const FloatingBottomNavbar({super.key, required this.currentIndex});

  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    // return BottomNavigationBar(
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: 'Home',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.list),
    //       label: 'Records',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.add),
    //       label: 'Add',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.motorcycle),
    //       label: 'Vehicles',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person),
    //       label: 'Profile',
    //     ),
    //   ],
    //   currentIndex: currentIndex,
    //   onTap: (val) {},
    //
    // );
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widthValue(context, 30),
        vertical: heightValue(context, 24),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.periwinkle,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        height: heightValue(context, 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.home,
                color: currentIndex == 0
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                color: currentIndex == 1
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.add,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.small(
                onPressed: () {},
                backgroundColor: AppColors.bgColor,
                child: const Icon(
                  Icons.add,
                  color: AppColors.periwinkle,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.motorcycle,
                color: currentIndex == 2
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.person,
                color: currentIndex == 3
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
