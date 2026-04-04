import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/signup/cubit/sign_up_cubit.dart';
import 'package:evoliving/app/widgets/agreement_checkbox.dart';
import 'package:evoliving/app/widgets/app_text_form_field.dart';
import 'package:evoliving/app/widgets/spacing.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Register',
            style: context.textThemeX.heading.bold.copyWith(
              color: AppColors.secondary,
            )),
        verticalSpace(20),
        AppTextFormField(
          onChanged: (value) => context.read<SignUpCubit>().nameChanged(value),
          hintText: 'Name',
          hintStyle: const TextStyle(color: AppColors.gray),
          inputTextStyle: const TextStyle(color: AppColors.secondary),
          prefixIcon: const Icon(Icons.person, color: AppColors.primary),
          backgroundColor: AppColors.light,
        ),
        verticalSpace(20),
        AppTextFormField(
          onChanged: (value) => context.read<SignUpCubit>().emailChanged(value),
          hintText: 'Email Address',
          hintStyle: const TextStyle(color: AppColors.gray),
          inputTextStyle: const TextStyle(color: AppColors.secondary),
          prefixIcon: const Icon(Icons.email, color: AppColors.primary),
          backgroundColor: AppColors.light,
        ),
        verticalSpace(20),
        AppTextFormField(
          onChanged: (value) =>
              context.read<SignUpCubit>().passwordChanged(value),
          hintText: 'Password',
          hintStyle: const TextStyle(color: AppColors.gray),
          inputTextStyle: const TextStyle(color: AppColors.secondary),
          prefixIcon: const Icon(Icons.password, color: AppColors.primary),
          suffixIcon:
              Icon(Icons.visibility_off, color: context.colorsX.primary),
          backgroundColor: AppColors.light,
        ),
        verticalSpace(20),
        AppTextFormField(
          onChanged: (value) =>
              context.read<SignUpCubit>().confirmedPasswordChanged(value),
          hintText: 'Confirm password',
          hintStyle: const TextStyle(color: AppColors.gray),
          inputTextStyle: const TextStyle(color: AppColors.secondary),
          prefixIcon: const Icon(Icons.password, color: AppColors.primary),
          suffixIcon:
              Icon(Icons.visibility_off, color: context.colorsX.primary),
          backgroundColor: AppColors.light,
        ),
        verticalSpace(5),
        const AgreementCheckbox(),
      ],
    );
  }
}
