import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/navigation_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/profile/presentation/widgets/profile_options.dart';
import 'package:evoliving/app/features/profile/presentation/widgets/work_with_item.dart';
import 'package:evoliving/app/features/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String name = 'profile-screen';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Assets.images.headerBackground.image(
              width: double.infinity,
              height: 185.h,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 50.h,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, right: 35).r,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: Assets.images.profile.image().image,
                      ),
                      Gap(12.w),
                      Text(
                        'George wassouf',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Assets.svgs.qrScan.svg(
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        width: 25.w,
                        height: 25.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(35.h),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ).r,
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 25, top: 25)
                    .r,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: context.colorsX.primary,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Work With',
                      style: context.textThemeX.large.copyWith(
                        color: context.colorsX.secondary,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      'More',
                      style: context.textThemeX.medium.copyWith(
                        color: context.colorsX.onSecondary.withOpacity(0.6),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: context.colorsX.onSecondary.withOpacity(0.6),
                    ),
                  ],
                ),
                Gap(30.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WorkWithItem(
                      title: 'Alexa',
                      imagePath: 'assets/svgs/alexa.svg',
                    ),
                    WorkWithItem(
                      title: 'Google \nAssistant',
                      imagePath: 'assets/svgs/google_assistant.svg',
                    ),
                    WorkWithItem(
                      title: 'Smart Thing',
                      imagePath: 'assets/svgs/smart_thing.svg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Gap(35.h),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20).r,
          child: Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 35,
              top: 35,
            ).r,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: context.colorsX.primary,
            ),
            child: Column(
              children: [
                const ProfileOptions(
                  name: 'Home Management',
                  icon: Icons.home_outlined,
                ),
                Gap(50.h),
                const ProfileOptions(
                  name: 'Help center',
                  icon: Icons.help_outline,
                ),
                Gap(50.h),
                const ProfileOptions(
                  name: 'Message Center',
                  icon: Icons.message_outlined,
                ),
                Gap(50.h),
                ProfileOptions(
                  onTap: () =>
                     context.pushNamed(SettingsScreen.name),
                  name: 'Settings',
                  icon: Icons.settings_outlined,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
