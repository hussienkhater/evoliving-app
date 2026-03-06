import 'package:evoliving/app/features/settings/sub_features/account_and_security/presentation/widgets/lock_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

class AccountAndSecurityScreen extends StatelessWidget {
  const AccountAndSecurityScreen({super.key});

  static const String name = 'account-and-security-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Account and Security', style: context.textThemeX.heading),
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
          const Gap(30),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              color: context.colorsX.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Text(
                    'Region',
                    style: context.textThemeX.large.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Egypt',
                    style: context.textThemeX.medium.copyWith(
                      color: context.colorsX.onPrimary.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(30),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              color: context.colorsX.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Adrress',
                        style: context.textThemeX.medium.copyWith(
                          color: context.colorsX.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        'hussienkhater10@gmail.com',
                        style: context.textThemeX.medium.copyWith(
                          color: context.colorsX.onPrimary.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Egypt',
                    style: context.textThemeX.medium.copyWith(
                      color: context.colorsX.onPrimary.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(30),
          Container(
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
            child: const Column(
              children: [
                LockOptions(text: 'Change Login password'),
                Gap(40),
                LockOptions(text: 'Face ID'),
                Gap(40),
                LockOptions(text: 'Pattern Lock'),
              ],
            ),
          ),
          const Gap(30),
          Container(
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              color: context.colorsX.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Text(
                    'User Code',
                    style: context.textThemeX.medium.copyWith(
                      color: context.colorsX.onPrimary,
                      //fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'dgjui6804',
                    style: context.textThemeX.medium.copyWith(
                      color: context.colorsX.onPrimary.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Gap(30),
          InkWell(
            onTap: () {},
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: context.colorsX.error,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'Delete Account',
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
    );
  }
}
