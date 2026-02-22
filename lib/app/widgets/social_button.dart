import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/features/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SocialButton extends StatelessWidget {
  final Widget widget;
  final VoidCallback onTap;

  const SocialButton({
    required this.widget,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 65.h,
        width: 100.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: widget,
      ),
    );
  }
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _socialButton(Assets.svgs.facebook.svg(), 'Facebook'),
            SizedBox(width: 16.w),
            _socialButton(
              Assets.svgs.google.svg(
                colorFilter:
                    const ColorFilter.mode(AppColors.light, BlendMode.srcIn),
              ),
              'Google',
              onTap: () {
                context.read<LoginCubit>().logInWithGoogle();
              },
            ),
            SizedBox(width: 16.w),
            _socialButton(
              Assets.svgs.apple.svg(
                colorFilter:
                    const ColorFilter.mode(AppColors.light, BlendMode.srcIn),
              ),
              'Apple',
            ),
          ],
        );
      },
    );
  }

  Widget _socialButton(Widget widget, String label, {VoidCallback? onTap}) {
    return SocialButton(
      widget: widget,
      onTap: onTap ?? () {},
    );
  }
}
