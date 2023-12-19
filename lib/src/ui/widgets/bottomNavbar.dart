import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petroleum/src/core/routes/router.dart';
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

class FloatingBottomNavbar extends StatefulWidget {
  final int currentIndex;

  const FloatingBottomNavbar({super.key, required this.currentIndex});

  @override
  State<FloatingBottomNavbar> createState() => _FloatingBottomNavbarState();
}

class _FloatingBottomNavbarState extends State<FloatingBottomNavbar> {
  @override
  Widget build(BuildContext context) {
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
            _FloatingNavbarItemButton(
              icon: Icon(
                Icons.home,
                color: widget.currentIndex == 0
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
              isActive: widget.currentIndex == 0,
              onTap: () => switchToPage(0),
            ),
            _FloatingNavbarItemButton(
              onTap: () => switchToPage(1),
              icon: Icon(
                Icons.list,
                color: widget.currentIndex == 1
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
              isActive: widget.currentIndex == 1,
            ),
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
            _FloatingNavbarItemButton(
              onTap: () => switchToPage(2),
              icon: Icon(
                Icons.motorcycle,
                color: widget.currentIndex == 2
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
              isActive: widget.currentIndex == 2,
            ),
            _FloatingNavbarItemButton(
              onTap: () => switchToPage(3),
              icon: Icon(
                Icons.person,
                color: widget.currentIndex == 3
                    ? AppColors.titleTextColor
                    : Color(0xFF182A3A),
              ),
              isActive: widget.currentIndex == 3,
            ),
          ],
        ),
      ),
    );
  }

  switchToPage(int index) {
    if (widget.currentIndex == index) {
      return;
    } else {
      switch (index) {
        case 0:
          GoRouter.of(context).go(AppRoutes.home);
          break;

        case 1:
          GoRouter.of(context).go(AppRoutes.records);
          break;

        case 2:
          GoRouter.of(context).go(AppRoutes.vehicles);
          break;

        case 3:
          GoRouter.of(context).go(AppRoutes.profile);
          break;
      }
    }
  }
}

class _FloatingNavbarItemButton extends StatelessWidget {
  final Widget icon;

  final bool isActive;
  final Function onTap;
  const _FloatingNavbarItemButton({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(),
      // icon: Icon(
      //   Icons.person,
      //   color: isActive ? AppColors.titleTextColor : const Color(0xFF182A3A),
      // ),
      icon: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: isActive
                ? BorderSide(
                    color: Color(0xFF182A3A),
                    width: 3,
                  )
                : BorderSide.none,
          ),
        ),
        child: icon,
      ),
    );
  }
}
