import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

class PrivacySettingsScreen extends StatelessWidget {
  const PrivacySettingsScreen({super.key});

  static const String name = 'privacy-Settings-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Privacy Settings Settings',
            style: context.textThemeX.heading),
        centerTitle: true,
        leadingWidth: 80.w,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            child: Assets.svgs.backArrow.svg(),
            onTap: () => context.pop(),
          ),
        ),
      ),
      body: const _PrivacySettingsContainer(),
    );
  }
}

class _PrivacySettingsContainer extends StatelessWidget {
  const _PrivacySettingsContainer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorsX.primary, // Dark blue-gray background
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _PrivacySettingItem(title: 'Rate Us'),
            _SettingsDivider(),
            _PrivacySettingItem(title: 'Open Source Component License'),
            _SettingsDivider(),
            _PrivacySettingItem(title: 'Upload Log'),
            _SettingsDivider(),
            _VersionSettingItem(),
            _SettingsDivider(),
            _PrivacySettingItem(title: 'Check for updates'),
          ],
        ),
      ),
    );
  }
}

class _PrivacySettingItem extends StatelessWidget {
  final String title;

  const _PrivacySettingItem({required this.title});

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
        color: Colors.white54,
        size: 24.w,
      ),
      onTap: () {
        // TODO: Implement navigation or action
      },
    );
  }
}

class _VersionSettingItem extends StatelessWidget {
  const _VersionSettingItem();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Current Version',
          style: context.textThemeX.large.bold.copyWith(
            color: context.colorsX.background,
          )),
      trailing: Text('16.1(74774857)',
          style: context.textThemeX.small.copyWith(
            color: context.colorsX.background.withValues(alpha: 0.5),
          )),
      onTap: () {
        // TODO: Implement version details action
      },
    );
  }
}

class _SettingsDivider extends StatelessWidget {
  const _SettingsDivider();

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
