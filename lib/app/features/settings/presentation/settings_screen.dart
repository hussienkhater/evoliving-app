import 'package:evoliving/app/features/settings/sub_features/personal_information/presentation/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/settings/domain/settings_item.dart';
import 'package:evoliving/app/features/settings/sub_features/about/presentation/about_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/dark_theme/presentation/dark_theme_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/language_selection/presentaion/language_selection_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/more_features/presentation/more_features_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/priivacy_settings/privacy_settings_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/privacy_policy/presentaion/privacy_policy_screen.dart';
import 'package:evoliving/app/widgets/screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const String name = 'settings-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Settings', style: context.textThemeX.heading),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsSection(
              items: [
                SettingsItem(
                    title: 'Personal Information',
                    route: PersonalInformationScreen.name),
                SettingsItem(
                    title: 'Account and Security', route: '/account-security'),
                SettingsItem(title: 'Device Update', route: '/device-update'),
              ],
            ),
            Gap(16.h),
            SettingsSection(
              items: [
                SettingsItem(
                  title: 'App Notification',
                  route: '/notifications',
                ),
                SettingsItem(
                  title: 'Dark Mode',
                  route: DarkModeScreen.name,
                ),
                SettingsItem(
                  title: 'Temperature Unit',
                  route: '/temp-unit',
                ),
                SettingsItem(
                  title: 'Language',
                  route: LanguageSelectionScreen.name,
                ),
                SettingsItem(
                  title: 'More Features',
                  route: MoreFeaturesScreen.name,
                ),
              ],
            ),
            Gap(16.h),
            SettingsSection(
              items: [
                SettingsItem(
                  title: 'About',
                  route: AboutScreen.name,
                ),
                SettingsItem(
                  title: 'Privacy Settings',
                  route: PrivacySettingsScreen.name,
                ),
                SettingsItem(
                  title: 'Privacy Policy Management',
                  route: PrivacyPolicyScreen.name,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsSection extends StatelessWidget {
  final List<SettingsItem> items;

  const SettingsSection({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorsX.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: items.map((item) => SettingsTile(item: item)).toList(),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final SettingsItem item;

  const SettingsTile({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        item.title,
        style: context.textThemeX.large.bold.copyWith(
          color: context.colorsX.background,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16.sp,
        color: context.colorsX.background,
      ),
      onTap: () {
        if (item.route == '/temp-unit') {
          _showTemperatureUnitDialog(context);
        } else {
          context.pushNamed(item.route);
        }
      },
    );
  }

  void _showTemperatureUnitDialog(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      backgroundColor: Colors.transparent, // Ensures full styling control
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(12.w),
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
            color: context.colorsX.primary, // Dark background
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOption(context, '°C', () {
                Navigator.pop(context, 'C');
              }),
              Divider(color: context.colorsX.background, thickness: 1),
              _buildOption(context, '°F', () {
                Navigator.pop(context, 'F');
              }),
              Divider(color: context.colorsX.background, thickness: 2),
              _buildOption(context, 'Cancel', () {
                Navigator.pop(context);
              }, isCancel: true),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(BuildContext context, String label, VoidCallback onTap,
      {bool isCancel = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        alignment: Alignment.center,
        child: Text(
          label,
          style: context.textThemeX.large.copyWith(
            color: context.colorsX.background,
            fontWeight: isCancel ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
