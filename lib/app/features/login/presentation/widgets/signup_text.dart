import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/features/signup/presentation/sign_up_screen.dart';

class SignupText extends StatelessWidget {
  const SignupText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Don’t Have An Account?',
        style: TextStyle(
          color: AppColors.secondary,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          fontFamily: GoogleFonts.monomaniacOne().fontFamily,
        ),
        children: [
          TextSpan(
            text: '  Sign Up',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.monomaniacOne().fontFamily,
              fontSize: 16.sp,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.goNamed(SignUpScreen.name);
              },
          ),
        ],
      ),
    );
  }
}
