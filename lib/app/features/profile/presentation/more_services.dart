import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/settings/presentation/settings_screen.dart';
import 'package:evoliving/app/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MoreServices extends StatelessWidget {
  const MoreServices({super.key});

  static const String name = 'more-services';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('More Services', style: context.textThemeX.heading),
        centerTitle: true,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InkWell(
            child: Assets.svgs.backArrow.svg(),
            onTap: () => context.pop(),
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => _showBottomSheet(context),
                    child: Assets.svgs.moreOptions.svg(),
                  ),
                  Gap(10.w),
                  InkWell(
                    onTap: () => context.pop(),
                    child: Assets.svgs.cancel.svg(),
                  ),
                ],
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServiceDetails(
                imagePath: Assets.svgs.googleAssistant.path,
                service: 'Google Assistant',
                companyName: 'Google',
              ),
              ServiceDetails(
                imagePath: Assets.svgs.alexa.path,
                service: 'Alexa',
                companyName: 'Amazon Alexa',
              ),
            ],
          ),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ServiceDetails(
                imagePath: Assets.svgs.smartThing.path,
                service: 'SmartThings',
                companyName: 'Samsung ',
              ),
              ServiceDetails(
                imagePath: Assets.svgs.iftttLogo.path,
                service: 'IFTTT',
                companyName: 'IFTTT',
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({
    super.key,
    required this.imagePath,
    required this.service,
    required this.companyName,
  });
  final String imagePath;
  final String service;
  final String companyName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 180.w,
      decoration: BoxDecoration(
        color: context.colorsX.primary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgGenImage(imagePath).svg(
                // width: 50.w,
                // height: 50.h,
                ),
            Gap(8.h),
            Text(
              service,
              style: context.textThemeX.large.bold
                  .copyWith(color: context.colorsX.background),
            ),
            Text(
              companyName,
              style: context.textThemeX.medium
                  .copyWith(color: context.colorsX.background),
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: context.colorsX.primary,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Title
            Text(
              "Third-party Voice Assistant",
              style: context.textThemeX.large.bold
                  .copyWith(color: context.colorsX.background),
            ),
            Gap(15.h),

            Divider(color: context.colorsX.background.withOpacity(.3)),

            Gap(20.h),

            /// Buttons Row
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(35.w),
                _bottomItem(
                  context,
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                    );
                  },
                ),
                Gap(25.w),
                _bottomItem(
                  context,
                  icon: Icons.refresh_outlined,
                  title: "Reload",
                  onTap: () => Navigator.pop(context),
                ),
                Gap(25.w),
                _bottomItem(
                  context,
                  icon: Icons.report_problem,
                  title: "Help And \n Feedback",
                ),
              ],
            ),

            Gap(20.h),

            Divider(color: context.colorsX.background.withOpacity(.3)),

            /// Cancel
            InkWell(
              onTap: () => context.pop(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  "Cancel",
                  style: context.textThemeX.large.bold
                      .copyWith(color: context.colorsX.background),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

Widget _bottomItem(
  BuildContext context, {
  required String title,
  required IconData icon,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 65.h,
          width: 65.w,
          padding: EdgeInsets.all(12.r),
          decoration: BoxDecoration(
            color: context.colorsX.background,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            size: 45.w,
            color: context.colorsX.primary,
          ),
        ),
        Gap(6.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: context.textThemeX.medium
              .copyWith(color: context.colorsX.background),
        ),
      ],
    ),
  );
}
