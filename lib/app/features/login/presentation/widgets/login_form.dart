import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/login/cubit/login_cubit.dart';
import 'package:evoliving/app/widgets/agreement_checkbox.dart';
import 'package:evoliving/app/widgets/app_text_form_field.dart';
import 'package:evoliving/app/widgets/spacing.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: context.textThemeX.heading.bold.copyWith(
            color: AppColors.secondary,
          ),
        ),
        verticalSpace(20),
        AppTextFormField(
          onChanged: (value) => context.read<LoginCubit>().emailChanged(value),
          hintText: 'Email',
          hintStyle: const TextStyle(color: AppColors.gray),
          inputTextStyle: const TextStyle(color: AppColors.secondary),
          prefixIcon: Icon(Icons.email, color: context.colorsX.primary),
          backgroundColor: AppColors.light,
        ),
        verticalSpace(20),
        AppTextFormField(
          onChanged: (value) =>
              context.read<LoginCubit>().passwordChanged(value),
          hintText: 'Password',
          hintStyle: const TextStyle(color: AppColors.gray),
          inputTextStyle: const TextStyle(color: AppColors.secondary),
          obscureText: true,
          prefixIcon: Icon(Icons.password, color: context.colorsX.primary),
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
