import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/extension_methods/context_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/features/home/presentation/home_screen.dart';
import 'package:evoliving/app/features/login/cubit/login_cubit.dart';
import 'package:evoliving/app/features/login/presentation/widgets/login_form.dart';
import 'package:evoliving/app/features/login/presentation/widgets/signup_text.dart';
import 'package:evoliving/app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:evoliving/app/widgets/app_logo.dart';
import 'package:evoliving/app/widgets/button.dart';
import 'package:evoliving/app/widgets/custom_divider.dart';
import 'package:evoliving/app/widgets/social_button.dart';
import 'package:evoliving/app/widgets/spacing.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String name = 'login-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: AppColors.light),
        padding: EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 20.0.h),
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
              ), // شعار التطبيق يظهر بتأثير FadeInDown
              FadeInUp(
                duration: const Duration(milliseconds: 600),
                child: const LoginForm(),
              ), // فورم تسجيل الدخول يظهر بتأثير FadeInUp
              verticalSpace(20),
              BounceInUp(
                duration: const Duration(milliseconds: 700),
                child: _LoginButton(),
              ), // زر تسجيل الدخول يظهر بتأثير BounceInUp
              verticalSpace(50),
              ZoomIn(
                duration: const Duration(milliseconds: 800),
                child: const CustomDivider(),
              ), // الخط الفاصل يظهر بتأثير ZoomIn
              verticalSpace(20),
              SlideInLeft(
                duration: const Duration(milliseconds: 900),
                child: const SocialButtons(),
              ), // أزرار تسجيل الدخول بالسوشيال تظهر بتأثير SlideInLeft
              verticalSpace(20),
              SlideInRight(
                duration: const Duration(milliseconds: 1000),
                child: const SignupText(),
              ), // نص التسجيل يظهر بتأثير SlideInRight
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state.status.isSuccess) {
          context.pushReplacementNamed(HomeScreen.name);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 30,
                  ),
                  horizontalSpace(10),
                  Text(
                    'Login success',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.light,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
              backgroundColor: AppColors.primary,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              elevation: 6,
              duration: const Duration(seconds: 3),
            ),
          );
        } else if (state.status.isFailure) {
          context.scaffoldMessenger
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Login Failure'),
              ),
            );
        }
      },
      builder: (context, state) {
        return Button.filled(
          color: state.isValid
              ? AppColors.primary
              : AppColors.primary.withOpacity(0.8),
          maxWidth: true,
          isLoading: state.status.isInProgress,
          density: ButtonDensity.comfortable,
          shape: ButtonShape.roundedCorners,
          onPressed: () {
            context.read<LoginCubit>().logIn();
          },
          label: 'Login',
        );
      },
    );
  }
}
