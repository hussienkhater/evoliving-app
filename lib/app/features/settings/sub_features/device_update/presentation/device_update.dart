import 'package:evoliving/app/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

class DeviceUpdate extends StatelessWidget {
  const DeviceUpdate({super.key});

  static const String name = 'device-update';

  @override
  Widget build(BuildContext context) {
    return Screen(
        appBar: AppBar(
          title: Text('Device Update', style: context.textThemeX.heading),
          centerTitle: true,
          leadingWidth: 80.w,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: InkWell(
              child: Assets.svgs.backArrow.svg(),
              onTap: () => context.pop(),
            ),
          ),
        ),
        body: Center(
          child: Text(
            'All Update',
            style: context.textThemeX.large.copyWith(
              color: context.colorsX.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
