import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';
import 'package:evoliving/app/features/onboarding/domain/models/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  final PageController pageController = PageController();
  int currentPage = 0;

  bool get isLastPage => currentPage == onboardingPages.length - 1;

  /// **Fix `skipButton`**
  void skipButton(BuildContext context) {
    context.goNamed(LoginScreen.name);
  }

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnboardingPageChanged(currentPage, isLastPage));
  }

  void onBoardingNext(BuildContext context) {
    if (isLastPage) {
      skipButton(context);
    } else {
      currentPage++;
      pageController.nextPage(
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOut,
      );
      emit(OnboardingPageChanged(currentPage, isLastPage));
    }
  }

  List<OnBoardingModel> onboardingPages = [
    OnBoardingModel(
      Assets.images.on1.path,
      'Welcome to EvoLiving',
      'Smart Living Made Simple,\nYou don’t need to be a tech expert to enjoy a smart home.EvoLiving provides intuitive, user-friendly solutions designed for all lifestyles.',
    ),
    OnBoardingModel(
      Assets.images.on1.path,
      'Welcome to EvoLiving',
      'All-in-One Home Automation,\nFrom lighting and climate control to security and energy management —EvoLiving brings all your devices together in one unified platform.',
    ),
    OnBoardingModel(
      Assets.images.on2.path,
      'Welcome to EvoLiving',
      'Trusted by Homeowners & Innovators,\nOur system is a reliable choice for families, tech enthusiasts, and smart-home creators who want stability, efficiency, and future-ready automation.',
    ),
  ];
}
