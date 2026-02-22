import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';

class PermissionTile extends StatelessWidget {
  final String title;
  final String description;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final bool isNavigable;
  final VoidCallback? onTap;

  const PermissionTile({
    required this.title,
    required this.description,
    super.key,
    this.value,
    this.onChanged,
    this.isNavigable = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        title: Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Text(
            title,
            style: context.textThemeX.large.bold.copyWith(
              color: context.colorsX.background,
            ),
          ),
        ),
        subtitle: Text(description,
            style: context.textThemeX.small.copyWith(
              color: context.colorsX.background,
            )),
        trailing: isNavigable
            ? Icon(
                Icons.arrow_forward_ios,
                size: 18.sp,
                color: context.colorsX.secondary,
              )
            : Switch(
                activeTrackColor: context.colorsX.secondary,
                activeColor: context.colorsX.primary,
                value: value ?? false,
                onChanged: onChanged,
              ),
        onTap: isNavigable ? onTap : null,
      ),
    );
  }
}
