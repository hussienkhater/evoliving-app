import 'package:evoliving/app/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/screen.dart';

import 'package:evoliving/app/features/authentication/presentation/bloc/auth_cubit.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  static const String name = 'personal-information-screen';

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState
    extends State<PersonalInformationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text(
          'Personal Information',
          style: context.textThemeX.heading,
        ),
        centerTitle: true,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InkWell(
            onTap: () => context.pop(),
            child: Assets.svgs.backArrow.svg(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final isSuccess = state is SuccessState;

            final userName = isSuccess
                ? (state.user.user?.userName ?? '')
                : '';

            final email = isSuccess
                ? (state.user.user?.email ?? '')
                : '';

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(50.h),

                  /// PROFILE IMAGE
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.w),
                          height: 200.h,
                          width: 200.w,
                          child: Image.asset(
                            Assets.images.profile.path,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 75,
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: context.colorsX.mintGreen,
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                            child: SvgPicture.asset(
                              Assets.svgs.changePhoto.path,
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Gap(50.h),

                  /// NAME
                  Text(
                    'Name',
                    style: context.textThemeX.large.bold.copyWith(
                      color: context.colorsX.primary,
                    ),
                  ),
                  Gap(8.h),

                  AppTextFormField(
                    controller: _nameController,
                    hintText: userName.isEmpty
                        ? 'Enter your name'
                        : userName,
                    backgroundColor: context.colorsX.primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.colorsX.primary,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: context.textThemeX.large.copyWith(
                      color:
                          context.colorsX.background.withOpacity(0.7),
                    ),
                  ),

                  Gap(16.h),

                  /// EMAIL
                  Text(
                    'Email',
                    style: context.textThemeX.large.bold.copyWith(
                      color: context.colorsX.primary,
                    ),
                  ),
                  Gap(8.h),

                  AppTextFormField(
                    controller: _emailController,
                    hintText:
                        email.isEmpty ? 'Enter your email' : email,
                    backgroundColor: context.colorsX.primary,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.colorsX.primary,
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintStyle: context.textThemeX.large.copyWith(
                      color:
                          context.colorsX.background.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}