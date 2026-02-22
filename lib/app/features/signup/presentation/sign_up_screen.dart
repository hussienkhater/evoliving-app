import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/features/signup/cubit/sign_up_cubit.dart';
import 'package:evoliving/app/features/signup/presentation/widgets/register_form.dart';
import 'package:evoliving/app/features/signup/presentation/widgets/signup_text.dart';
import 'package:evoliving/app/widgets/app_logo.dart';
import 'package:evoliving/app/widgets/button.dart';
import 'package:evoliving/app/widgets/custom_divider.dart';
import 'package:evoliving/app/widgets/social_button.dart';
import 'package:evoliving/app/widgets/spacing.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String name = 'register-screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpCubit(context.read()),
      child: const _SignUpView(),
    );
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
              const SizedBox(
                height: 200,
                width: 200,
                child: AppLogo(),
              ),
              const RegisterForm(),
              verticalSpace(20),
              const _SignUpButton(),
              verticalSpace(80),
              const CustomDivider(),
              verticalSpace(20),
              const SocialButtons(),
              verticalSpace(20),
              const LoginText(),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }
      },
      builder: (context, state) {
        return Button.filled(
          color: state.isValid
              ? context.colorsX.secondary
              : context.colorsX.secondary.withOpacity(0.6),
          maxWidth: true,
          shape: ButtonShape.roundedCorners,
          isLoading: state.status.isLoading,
          density: ButtonDensity.comfortable,
          onPressed: state.isValid
              ? () => context.read<SignUpCubit>().signUpFormSubmitted()
              : null,
          label: 'Get Verification Code',
        );
      },
    );
  }
}
