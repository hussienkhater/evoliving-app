import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/navigation_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/home/domain/model/devices.dart';
import 'package:evoliving/app/features/home/presentation/widgets/device_card.dart';
import 'package:evoliving/app/features/home/presentation/widgets/welcome_header.dart';
import 'package:evoliving/app/widgets/spacing.dart';
import 'package:animate_do/animate_do.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350.h,
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 300.h,
                  width: context.width,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  decoration: BoxDecoration(
                    color: context.colorsX.primary,
                    image: DecorationImage(
                      image: AssetImage(Assets.images.lines.path),
                      opacity: 0.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: const WelcomeHeader(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 80.h,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemBuilder: (context, index) => BounceInUp(
                      duration: Duration(milliseconds: 700 + (index * 100)),
                      // تأخير بسيط لكل عنصر
                      child: Container(
                        height: 80.h,
                        width: 190.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: context.colorsX.secondary,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 54.h,
                              width: 54.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: context.colorsX.background,
                              ),
                              child: Assets.svgs.vector.svg(),
                            ),
                            horizontalSpace(10),
                            Text(
                              'All Devices',
                              style: context.textThemeX.medium,
                            )
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => horizontalSpace(15),
                  ),
                ),
              ),
            ],
          ),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: DeviceConstants.devices.length,
          itemBuilder: (context, index) {
            final device = DeviceConstants.devices[index];
            return FadeInUp(
              duration: Duration(milliseconds: 600 + (index * 100)),
              // تأخير بسيط لكل عنصر
              child: DeviceCard(
                deviceName: device.name,
                deviceLocation: device.location,
                imagePath: device.imagePath,
              ),
            );
          },
        ),
      ],
    );
  }
}
