import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/button.dart';
import 'package:evoliving/app/widgets/screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  static const String name = 'language-selection-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Language', style: context.textThemeX.heading),
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
      body: Column(
        children: [
          Gap(20.h),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: context.textThemeX.medium.bold.copyWith(
                color: context.colorsX.background,
              ),
              filled: true,
              fillColor: context.colorsX.primary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(Icons.search, color: context.colorsX.background),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 5, // Replace with actual language list
              separatorBuilder: (context, index) => Divider(
                height: 16.h,
              ),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    'English',
                    style: context.textThemeX.large.bold,
                  ),
                  onTap: () => _showConfirmationDialog(context),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: context.colorsX.primary,
          content: Text(
            'You must restart the app to make the new language take effect.\nContinue?',
            style: context.textThemeX.medium.bold
                .copyWith(color: context.colorsX.background),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: Text('Cancel',
                  style: context.textThemeX.medium.bold.copyWith(
                    color: context.colorsX.background,
                  )),
            ),
            Button.filled(
              color: context.colorsX.secondary,
              shape: ButtonShape.roundedCorners,
              onPressed: () {}, // Implement restart logic
              label: 'Confirm',
            ),
          ],
        );
      },
    );
  }
}
