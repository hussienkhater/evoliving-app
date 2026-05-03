import 'package:evoliving/app/features/signup/presentation/widgets/signup_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/extension_methods/context_x.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';
import 'package:evoliving/app/features/signup/cubit/sign_up_cubit.dart';
import 'package:evoliving/app/features/signup/presentation/widgets/register_form.dart';
import 'package:evoliving/app/widgets/app_logo.dart';
import 'package:evoliving/app/widgets/button.dart';
import 'package:evoliving/app/widgets/custom_divider.dart';
import 'package:evoliving/app/widgets/social_button.dart';
import 'package:evoliving/app/widgets/spacing.dart';
import 'package:animate_do/animate_do.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String name = 'signup-screen';

  @override
  Widget build(BuildContext context) {
    return const _SignUpView();
  }
}

class _SignUpView extends StatelessWidget {
  const _SignUpView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: AppColors.light),
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: const SizedBox(
                  height: 200,
                  width: 200,
                  child: AppLogo(),
                ),
              ),

              FadeInUp(
                duration: const Duration(milliseconds: 600),
                child: const RegisterForm(),
              ),

              verticalSpace(20),

              BounceInUp(
                duration: const Duration(milliseconds: 700),
                child:  _SignUpButton(
                  onPressed: (){},
                ),
              ),

              verticalSpace(50),

              // ZoomIn(
              //   duration: const Duration(milliseconds: 800),
              //   child: const CustomDivider(),
              // ),

              //verticalSpace(20),

              // SlideInLeft(
              //   duration: const Duration(milliseconds: 900),
              //   child: const SocialButtons(),
              // ),

              //verticalSpace(20),

              SlideInRight(
                duration: const Duration(milliseconds: 1000),
                child: const LoginText(),
              ),

              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool isLoading;

  const _SignUpButton({
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Button.filled(
      color: isEnabled
          ? AppColors.primary
          : AppColors.primary.withOpacity(0.8),
      maxWidth: true,
      isLoading: isLoading,
      density: ButtonDensity.comfortable,
      shape: ButtonShape.roundedCorners,
      onPressed: isEnabled ? onPressed : null,
      label: 'Create Account',
    );
  }
}