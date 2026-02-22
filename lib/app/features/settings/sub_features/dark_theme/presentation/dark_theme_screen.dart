import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart' show Assets;
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

class DarkModeScreen extends StatefulWidget {
  const DarkModeScreen({super.key});

  static const String name = 'dark-mode-screen';

  @override
  State<DarkModeScreen> createState() => _DarkModeScreenState();
}

class _DarkModeScreenState extends State<DarkModeScreen> {
  bool isDarkMode = false;
  bool isNormalMode = true;

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Dark Mode', style: context.textThemeX.heading),
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
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Container(
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: context.colorsX.primary, // Dark container
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSwitchRow('Normal Mode', isNormalMode, (value) {
                setState(() {
                  isNormalMode = value;
                  isDarkMode = !value;
                });
              }),
              Divider(color: context.colorsX.background, thickness: 1),
              _buildSwitchRow('Dark Mode', isDarkMode, (value) {
                setState(() {
                  isDarkMode = value;
                  isNormalMode = !value;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchRow(
      String label, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: context.textThemeX.large.bold
                .copyWith(color: context.colorsX.background)),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: context.colorsX.secondary,
          inactiveTrackColor: context.colorsX.background,
        ),
      ],
    );
  }
}
