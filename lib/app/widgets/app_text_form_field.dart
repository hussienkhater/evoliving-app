import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged; // Added onChanged callback

  const AppTextFormField({
    required this.hintText,
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.hintStyle,
    this.inputTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.onChanged, // Constructor parameter for onChanged
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validator?.call(value);
        },
        onChanged: onChanged,
        // Pass onChanged to the TextFormField
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          fillColor: backgroundColor ?? context.colorsX.secondary,
          filled: true,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.secondary, width: 1.3),
                borderRadius: BorderRadius.circular(10),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.secondary, width: 1.3),
                borderRadius: BorderRadius.circular(10),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colorsX.error, width: 1.3),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.colorsX.error, width: 1.3),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: hintStyle ??
              context.textThemeX.large.bold
                  .copyWith(color: context.colorsX.background),
          hintText: hintText,
        ),
        obscureText: obscureText ?? false,
        style: inputTextStyle ?? context.textThemeX.medium,
      ),
    );
  }
}
