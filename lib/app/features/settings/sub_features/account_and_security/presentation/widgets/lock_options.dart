import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LockOptions extends StatelessWidget {
  const LockOptions({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text,
            style: context.textThemeX.medium.copyWith(
              color: context.colorsX.onPrimary,
              //fontWeight: FontWeight.bold,
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
