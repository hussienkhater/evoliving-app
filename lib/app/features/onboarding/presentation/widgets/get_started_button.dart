import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/features/onboarding/domain/models/onboarding_model.dart';
import 'package:evoliving/app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:evoliving/app/widgets/spacing.dart';

class OnboardingPage extends StatelessWidget {
  final int index;

  const OnboardingPage({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    final onboardingData = cubit.onboardingPages[index];

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
          image: ExactAssetImage(onboardingData.imageAsset),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        child: Column(
          children: [
            if (Platform.isIOS) verticalSpace(18),
            FadeInDown(child: _SkipButton()),
            // زر التخطي يظهر بتأثير FadeInDown
            const Spacer(),
            FadeInUp(
              duration: const Duration(milliseconds: 500),
              child: _OnboardingContent(onboardingData: onboardingData),
            ),
            // محتوى الـ Onboarding يظهر بتأثير FadeInUp
            SizedBox(height: 40.h),
            ZoomIn(
              duration: const Duration(milliseconds: 600),
              child: _PageIndicator(),
            ),
            // المؤشر يظهر بتأثير ZoomIn
            SizedBox(height: 40.h),
            BounceInUp(
              duration: const Duration(milliseconds: 700),
              child: _NextButton(),
            ),
            // زر التالي يظهر بتأثير BounceInUp
          ],
        ),
      ),
    );
  }
}

class _SkipButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: TextButton(
        onPressed: () => context.read<OnboardingCubit>().skipButton(context),
        child: Text(
          'Skip',
          style: TextStyle(color: Colors.white, fontSize: 18.sp),
        ),
      ),
    );
  }
}

class _OnboardingContent extends StatelessWidget {
  final OnBoardingModel onboardingData;

  const _OnboardingContent({required this.onboardingData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          onboardingData.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          onboardingData.description, // ✅ FIXED: Corrected to use `description`
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _PageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<OnboardingCubit>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(cubit.onboardingPages.length, (index) {
        return AnimatedContainer(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          duration: const Duration(milliseconds: 900),
          width: 50,
          height: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: cubit.currentPage >= index
                ? context.colorsX.primary
                : context.colorsX.background,
          ),
        );
      }),
    );
  }
}

class _NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<OnboardingCubit>();
    final isLastPage = cubit.isLastPage;

    return Center(
      child: ElevatedButton(
        onPressed: () => cubit.onBoardingNext(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: context.colorsX.secondary,
          foregroundColor: Colors.white,
          minimumSize: Size(double.infinity, 50.w),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0.r),
          ),
        ),
        child: Text(
          isLastPage ? 'Start' : 'Next',
          style: TextStyle(
            fontSize: 20.sp,
            color: context.colorsX.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
