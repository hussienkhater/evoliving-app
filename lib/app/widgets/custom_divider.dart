import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _dividerLine(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Text(
            'OR Sign in With ',
            style: context.textThemeX.medium.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        _dividerLine(),
      ],
    );
  }

  Widget _dividerLine() {
    return Expanded(child: Container(height: 1.h, color: AppColors.primary));
  }
}
