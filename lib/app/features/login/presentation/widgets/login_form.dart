// import 'package:evoliving/app/features/authentication/presentation/bloc/auth_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:evoliving/app/core/constants/app_colors.dart';
// import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
// import 'package:evoliving/app/core/theming/app_colors_extension.dart';
// import 'package:evoliving/app/core/theming/text_theme_extension.dart';
// import 'package:evoliving/app/widgets/agreement_checkbox.dart';
// import 'package:evoliving/app/widgets/app_text_form_field.dart';
// import 'package:evoliving/app/widgets/spacing.dart';

// class LoginForm extends StatefulWidget {
//   const LoginForm({super.key});

//   @override
//   State<LoginForm> createState() => _LoginFormState();
// }

// class _LoginFormState extends State<LoginForm> {

// final _formKey = GlobalKey<FormState>();

//   late final TextEditingController _passwordController;

//   late final TextEditingController _emailController;

//   late final AuthCubit cubit;

//   @override
//   void initState() {
//     super.initState();
//     _emailController = TextEditingController();
//     _passwordController = TextEditingController();
//     cubit = AuthCubit();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Login',
//           style: context.textThemeX.heading.bold.copyWith(
//             color: AppColors.secondary,
//           ),
//         ),
//         verticalSpace(20),
//         AppTextFormField(
//           controller: _emailController,
//           onChanged: (value) => context.read<AuthCubit>().emailChanged(value),
//           hintText: 'Email',
//           hintStyle: const TextStyle(color: AppColors.gray),
//           inputTextStyle: const TextStyle(color: AppColors.secondary),
//           prefixIcon: Icon(Icons.email, color: context.colorsX.primary),
//           backgroundColor: AppColors.light,
//         ),
//         verticalSpace(20),
//         AppTextFormField(
//           controller: _passwordController,
//           onChanged: (value) =>
//               context.read<AuthCubit>().passwordChanged(value),
//           hintText: 'Password',
//           hintStyle: const TextStyle(color: AppColors.gray),
//           inputTextStyle: const TextStyle(color: AppColors.secondary),
//           obscureText: true,
//           prefixIcon: Icon(Icons.password, color: context.colorsX.primary),
//           suffixIcon:
//               Icon(Icons.visibility_off, color: context.colorsX.primary),
//           backgroundColor: AppColors.light,
//         ),
//         verticalSpace(5),
//         const AgreementCheckbox(),
//       ],
//     );
//   }
// }
