import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WorkWithItem extends StatelessWidget {
  const WorkWithItem({super.key, required this.title, required this.imagePath});

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgGenImage(imagePath).svg(
          width: 50.w,
          height: 50.h,
        ),
        Gap(8.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textThemeX.medium.copyWith(
            color: context.colorsX.onPrimary,
          ),
        ),
      ],
    );
  }
}
