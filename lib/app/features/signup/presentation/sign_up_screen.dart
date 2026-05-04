import 'dart:developer';

import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/authentication/data/models/request/register_request_model.dart';
import 'package:evoliving/app/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:evoliving/app/features/signup/presentation/widgets/signup_text.dart';
import 'package:evoliving/app/widgets/agreement_checkbox.dart';
import 'package:evoliving/app/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';
import 'package:evoliving/app/widgets/app_logo.dart';
import 'package:evoliving/app/widgets/button.dart';
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

class _SignUpView extends StatefulWidget {
  const _SignUpView();

  @override
  State<_SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<_SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account created successfully")),
            );
            context.pushReplacementNamed(LoginScreen.name);
          }
          if (state is ErrorState) {
            log(state.messageError);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.messageError)),
            );
          }
        },
        child: Form(
          key: _formKey,
          child: Container(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: context.textThemeX.heading.bold.copyWith(
                            color: AppColors.secondary,
                          ),
                        ),
                        verticalSpace(20),

                        AppTextFormField(
                          controller: nameController,
                          hintText: 'Name',
                          inputTextStyle:
                              const TextStyle(color: AppColors.secondary),
                          prefixIcon:
                              const Icon(Icons.person, color: AppColors.primary),
                          backgroundColor: AppColors.light,
                        ),

                        verticalSpace(20),

                        AppTextFormField(
                          controller: emailController,
                          hintText: 'Email Address',
                          inputTextStyle:
                              const TextStyle(color: AppColors.secondary),
                          prefixIcon:
                              const Icon(Icons.email, color: AppColors.primary),
                          backgroundColor: AppColors.light,
                        ),

                        verticalSpace(20),

                        AppTextFormField(
                          controller: passwordController,
                          hintText: 'Password',
                          inputTextStyle:
                              const TextStyle(color: AppColors.secondary),
                          obscureText: true,
                          prefixIcon: const Icon(Icons.password,
                              color: AppColors.primary),
                          suffixIcon: Icon(Icons.visibility_off,
                              color: context.colorsX.primary),
                          backgroundColor: AppColors.light,
                        ),

                        verticalSpace(20),

                        AppTextFormField(
                          controller: confirmPasswordController,
                          hintText: 'Confirm password',
                          inputTextStyle:
                              const TextStyle(color: AppColors.secondary),
                          obscureText: true,
                          prefixIcon: const Icon(Icons.password,
                              color: AppColors.primary),
                          suffixIcon: Icon(Icons.visibility_off,
                              color: context.colorsX.primary),
                          backgroundColor: AppColors.light,
                        ),

                        verticalSpace(5),
                        const AgreementCheckbox(),
                      ],
                    ),
                  ),

                  verticalSpace(20),

                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final isLoading = state is LoadingState;

                      return Button.filled(
                        isLoading: isLoading,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (passwordController.text !=
                                confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Passwords don't match")),
                              );
                              return;
                            }

                            await cubit.registerWithCredentials(
                              RegisterRequestModel(
                                userName: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                          }
                        },
                        color: AppColors.primary,
                        maxWidth: true,
                        density: ButtonDensity.comfortable,
                        shape: ButtonShape.roundedCorners,
                        label: 'Create Account',
                      );
                    },
                  ),

                  verticalSpace(50),

                  SlideInRight(
                    duration: const Duration(milliseconds: 1000),
                    child: const LoginText(),
                  ),

                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}