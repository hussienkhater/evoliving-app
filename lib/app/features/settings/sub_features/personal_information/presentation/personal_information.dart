import 'package:evoliving/app/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  static const String name = 'personal-information-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Personal Information', style: context.textThemeX.heading),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(50.h),
              Center(
                  child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    height: 200.h,
                    width: 200.w,
                    child: Image.asset(
                      Assets.images.profile.path,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 75,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: context.colorsX.mintGreen,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        child: SvgPicture.asset(
                          Assets.svgs.changePhoto.path,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Gap(50.h),
              Text(
                'Name',
                style: context.textThemeX.large.bold.copyWith(
                  color: context.colorsX.primary,
                ),
              ),
              Gap(8.h),
              AppTextFormField(
                hintText: 'John Doe',
                backgroundColor: context.colorsX.primary,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: context.colorsX.primary, width: 1.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: context.textThemeX.large.copyWith(
                  color: context.colorsX.background.withOpacity(0.7),
                ),
              ),
              // Container(
              //   padding: EdgeInsets.all(12.w),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: context.colorsX.primary,
              //     borderRadius: BorderRadius.circular(10.r),
              //   ),
              //   child: Text(
              //     'John Doe',
              //     style: context.textThemeX.large.copyWith(
              //       color: context.colorsX.background,
              //     ),
              //   ),
              // ),
              Gap(16.h),
              Text(
                'Email',
                style: context.textThemeX.large.bold.copyWith(
                  color: context.colorsX.primary,
                ),
              ),
              Gap(8.h),
              AppTextFormField(
                hintText: 'john.doe@example.com',
                backgroundColor: context.colorsX.primary,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: context.colorsX.primary, width: 1.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintStyle: context.textThemeX.large.copyWith(
                  color: context.colorsX.background.withOpacity(0.7),
                ),
              ),

              // Container(
              //   padding: EdgeInsets.all(12.w),
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: context.colorsX.primary,
              //     borderRadius: BorderRadius.circular(10.r),
              //   ),
              //   child: Text(
              //     'john.doe@example.com',
              //     style: context.textThemeX.large.copyWith(
              //       color: context.colorsX.background,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
