import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';

class AppScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppScaffold({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey('AppScaffold'));

  void _goBranch(int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: context.colorsX.primary,
      ),
      body: navigationShell,
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.ltr,
        child: ClipRRect(
          child: NavigationBar(
            height: 75.h,
            indicatorColor: Colors.transparent,
            backgroundColor: context.colorsX.primary,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: const Duration(milliseconds: 500),
            onDestinationSelected: _goBranch,
            selectedIndex: navigationShell.currentIndex,
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.mintGreen,
              ),
            ),
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.light,
                ),
                selectedIcon: Icon(
                  Icons.home_outlined,
                  color: AppColors.mintGreen,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.control_camera,
                  color: AppColors.light,
                ),
                selectedIcon: Icon(
                  Icons.control_camera,
                  color: AppColors.mintGreen,
                ),
                label: 'Control',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.motion_photos_auto,
                  color: AppColors.light,
                ),
                selectedIcon: Icon(
                  Icons.motion_photos_auto,
                  color: AppColors.mintGreen,
                ),
                label: 'Automation',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.verified_user,
                  color: AppColors.light,
                ),
                selectedIcon: Icon(
                  Icons.verified_user,
                  color: AppColors.mintGreen,
                ),
                label: 'ME',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
