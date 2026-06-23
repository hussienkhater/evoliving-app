import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/authentication/data/models/request/login_request_model.dart';
import 'package:evoliving/app/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:evoliving/app/widgets/agreement_checkbox.dart';
import 'package:evoliving/app/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/extension_methods/context_x.dart';
import 'package:evoliving/app/features/home/presentation/home_screen.dart';
import 'package:evoliving/app/features/login/presentation/widgets/signup_text.dart';
import 'package:evoliving/app/widgets/app_logo.dart';
import 'package:evoliving/app/widgets/button.dart';
import 'package:evoliving/app/widgets/custom_divider.dart';
import 'package:evoliving/app/widgets/social_button.dart';
import 'package:evoliving/app/widgets/spacing.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _passwordController;

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        bloc: cubit,
        listener: (context, state) {
          if (state is LoginSuccessState) {
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
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                elevation: 6,
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state is ErrorState) {
            context.scaffoldMessenger
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(state.messageError),
                ),
              );
          }
        },
        child: Form(
          key: _formKey,
          child: Container(
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
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 600),
                    child: Column(
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
                          controller: _emailController,
                          // onChanged: (value) =>
                          //     context.read<AuthCubit>().emailChanged(value),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: AppColors.gray),
                          inputTextStyle:
                              const TextStyle(color: AppColors.secondary),
                          prefixIcon:
                              Icon(Icons.email, color: context.colorsX.primary),
                          backgroundColor: AppColors.light,
                        ),
                        verticalSpace(20),
                        AppTextFormField(
                          controller: _passwordController,
                          // onChanged: (value) =>
                          //     context.read<AuthCubit>().passwordChanged(value),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: AppColors.gray),
                          inputTextStyle:
                              const TextStyle(color: AppColors.secondary),
                          obscureText: true,
                          prefixIcon: Icon(Icons.password,
                              color: context.colorsX.primary),
                          suffixIcon: Icon(Icons.visibility_off,
                              color: context.colorsX.primary),
                          backgroundColor: AppColors.light,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              'Forgot password?',
                              style: context.textThemeX.medium.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                        const AgreementCheckbox(),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  BounceInUp(
                    duration: const Duration(milliseconds: 700),
                    child: Button.filled(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<AuthCubit>().logInWithCredentials(
                                LoginRequestModel(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      color: AppColors.primary,
                      maxWidth: true,
                      density: ButtonDensity.comfortable,
                      shape: ButtonShape.roundedCorners,
                      label: 'Login',
                    ),
                  ),
                  verticalSpace(50),
                  ZoomIn(
                    duration: const Duration(milliseconds: 800),
                    child: const CustomDivider(),
                  ),
                  verticalSpace(20),
                  SlideInLeft(
                    duration: const Duration(milliseconds: 900),
                    child: const SocialButtons(),
                  ),
                  verticalSpace(20),
                  SlideInRight(
                    duration: const Duration(milliseconds: 1000),
                    child: const SignupText(),
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
