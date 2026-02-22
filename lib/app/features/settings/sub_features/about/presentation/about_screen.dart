import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String name = 'about-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('About', style: context.textThemeX.heading),
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
      body: const _AboutContainer(),
    );
  }
}

class _AboutContainer extends StatelessWidget {
  const _AboutContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorsX.primary,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _AboutDivider(),
            const _AboutDivider(),
            _AboutItem(
              title: 'Rate Us',
              onTap: () {},
            ),
            const _AboutDivider(),
            _AboutItem(
              title: 'Check for Updates',
              onTap: () {},
            ),
            const _AboutDivider(),
            _AboutItem(
              title: 'Open Source Licenses',
              onTap: () {},
            ),
            const _AboutDivider(),
            _AboutItem(
              title: 'Privacy Policy',
              onTap: () {},
            ),
            const _AboutDivider(),
            _AboutItem(
              title: 'Terms of Service',
              onTap: () {},
            ),
            const _AboutDivider(),
            _AboutItem(
              title: 'Contact Us',
              onTap: () {},
            ),
            const _AboutDivider(),

            // Version Number
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Text(
                'Version 1.0.0',
                style: context.textThemeX.small.copyWith(
                  color: context.colorsX.background,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _AboutItem({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: context.textThemeX.large.bold.copyWith(
          color: context.colorsX.background,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: context.colorsX.background,
        size: 24.w,
      ),
      onTap: onTap,
    );
  }
}

class _AboutDivider extends StatelessWidget {
  const _AboutDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white10,
      height: 1,
      thickness: 1,
      indent: 16.w,
      endIndent: 16.w,
    );
  }
}
