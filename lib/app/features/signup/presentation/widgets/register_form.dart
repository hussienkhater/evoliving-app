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
          onChanged: (value) => context.read<SignUpCubit>().emailChanged(value),
          hintText: 'Email Address',
          prefixIcon: const Icon(Icons.email, color: AppColors.primary),
          backgroundColor: AppColors.light,
        ),
        verticalSpace(5),
        const AgreementCheckbox(),
      ],
    );
  }
}
