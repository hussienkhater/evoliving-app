import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/settings/sub_features/more_features/presentation/home_device_overview_Screen.dart';
import 'package:evoliving/app/widgets/screen.dart';

class MoreFeaturesScreen extends StatelessWidget {
  const MoreFeaturesScreen({super.key});

  static const String name = 'more-features-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('More Features', style: context.textThemeX.heading),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(20.h),
          _FeatureCard(),
          Gap(20.h),
          _NavigationButton(
            title: 'Home Network Topology',
            onTap: () => context.pushNamed(HomeDeviceOverviewScreen.name),
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colorsX.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: const Column(
        children: [
          _FeatureToggle(
            title: 'Auto Add Discovered Device',
            description: 'Auto add a paired device, no need to confirm',
          ),
          _FeatureToggle(
            title: 'Scan device in Homepage',
            description: 'Auto display discovered devices on the homepage.',
          ),
          _FeatureToggle(
            title: 'Auto Add New Devices to Homepage',
            description:
                'Enabling this feature will automatically add new devices to the custom homepage. Otherwise, you will need to move them manually.',
          ),
        ],
      ),
    );
  }
}

class _FeatureToggle extends StatelessWidget {
  final String title;
  final String description;

  const _FeatureToggle({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textThemeX.large.bold.copyWith(
                    color: context.colorsX.background,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: context.textThemeX.small.copyWith(
                    color: context.colorsX.background.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: true,
            onChanged: (value) {},
            activeColor: context.colorsX.secondary,
          ),
        ],
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavigationButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: context.colorsX.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.textThemeX.large.bold.copyWith(
                color: context.colorsX.background,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: context.colorsX.background,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
