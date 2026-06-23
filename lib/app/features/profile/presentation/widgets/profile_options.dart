import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key, required this.name, required this.icon, this.onTap});
  final void Function()? onTap;
  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            color: context.colorsX.onPrimary,
          ),
          Gap(24.w),
          Text(
            name,
            style: context.textThemeX.medium.copyWith(
              color: context.colorsX.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.sp,
            color: context.colorsX.onPrimary,
          ),
        ],
      ),
    );
  }
}
