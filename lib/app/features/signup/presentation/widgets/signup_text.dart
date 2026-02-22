import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Have An Account?',
        style: TextStyle(
          color: AppColors.secondary,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.monomaniacOne().fontFamily,
        ),
        children: [
          TextSpan(
            text: '  Log IN',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.monomaniacOne().fontFamily,
              fontSize: 16.sp,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.goNamed(LoginScreen.name);
              },
          ),
        ],
      ),
    );
  }
}
