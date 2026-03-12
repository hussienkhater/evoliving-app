import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/widgets/button.dart';
import 'package:evoliving/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AutomationScreen extends StatelessWidget {
  const AutomationScreen({super.key});

  static const String name = 'automation-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'Automation',
              style: context.textThemeX.heading.copyWith(
                color: context.colorsX.primary,
              ),
            ),
            Text(
              'Tap-To-Run',
              style: context.textThemeX.medium.copyWith(
                color: context.colorsX.secondary.withOpacity(0.4),
              ),
            ),
          ],
        ),
        centerTitle: true,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: InkWell(
            child: Assets.svgs.add.svg(),
            onTap: () => context.pop(),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Icon(
              Icons.menu,
              color: context.colorsX.secondary,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Gap(100.h),
            Assets.images.emptyPana.image(
              width: 200.w,
              height: 200.h,
            ),
            Gap(15.h),
            Text(
              'Create a task and tap it to run. This enables easy control of your smart devices.',
              textAlign: TextAlign.center,
              style: context.textThemeX.medium.copyWith(
                color: context.colorsX.secondary.withOpacity(0.4),
              ),
            ),
            Gap(110.h),
            InkWell(
              onTap: () {},
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  color: context.colorsX.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Create Scene',
                    style: context.textThemeX.medium.copyWith(
                      color: context.colorsX.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
