import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:evoliving/app/features/splash/presentation/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const name = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Fade animation
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    // Start the animation
    _controller.forward();

    // Navigate to the next screen after 3 seconds
    Future.delayed(const Duration(seconds: 4), () async {
      context.goNamed(OnboardingScreen.name);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
      if (state is SplashSuccess) {
        // context.goNamed(getIt.authBloc.homeNamedRoute);
      }
    },
    child: Scaffold(
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          alignment: Alignment.center,
          decoration:  BoxDecoration(
            color:AppColors.light, // Background color
            image: DecorationImage(
              image: AssetImage(Assets.images.splashScreen.path),
              fit: BoxFit.fill,
            ),
          ),

        ),
      ),
    ));
  }
}
