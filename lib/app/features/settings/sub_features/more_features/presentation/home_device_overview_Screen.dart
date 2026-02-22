import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

class HomeDeviceOverviewScreen extends StatelessWidget {
  const HomeDeviceOverviewScreen({super.key});

  static const String name = 'home-device-overview-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Home Device Overview', style: context.textThemeX.heading),
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
          Row(
            children: [
              Icon(
                Icons.home_outlined,
                color: context.colorsX.primary,
                size: 30.w,
              ),
              SizedBox(width: 8.w),
              Text('My Home..', style: context.textThemeX.heading.bold),
            ],
          ),
          SizedBox(height: 20.h),
          _DeviceCard(),
        ],
      ),
    );
  }
}

class _DeviceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colorsX.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Standalone Devices',
            style: context.textThemeX.large.bold.copyWith(
              color: context.colorsX.background.withValues(alpha: 0.7),
            ),
          ),
          Divider(color: context.colorsX.background, thickness: 1),
          _DeviceItem(
            title: 'Smart IR Remote',
            icon: Assets.images.smartLamp.image(height: 60.h, width: 60.w),
          ),
        ],
      ),
    );
  }
}

class _DeviceItem extends StatelessWidget {
  final String title;
  final Widget icon;

  const _DeviceItem({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: context.colorsX.primary,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 10.w),
            Text(
              title,
              style: context.textThemeX.large.bold.copyWith(
                color: context.colorsX.background,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
