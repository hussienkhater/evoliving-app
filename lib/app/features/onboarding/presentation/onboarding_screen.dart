import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/features/onboarding/presentation/cubit/onboarding_cubit.dart';

import 'package:evoliving/app/features/onboarding/presentation/widgets/get_started_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  static const String name = 'onboarding-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  context.colorsX.primary,
                  context.colorsX.primary,
                  context.colorsX.background,
                ],
              ),
            ),
            child: PageView.builder(
              controller: cubit.pageController,
              onPageChanged: cubit.onPageChanged,
              itemCount: cubit.onboardingPages.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  index: index,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
