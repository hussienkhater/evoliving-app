import 'package:flutter/material.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';

class AgreementCheckbox extends StatefulWidget {
  const AgreementCheckbox({super.key});

  @override
  State<AgreementCheckbox> createState() => _AgreementCheckboxState();
}

class _AgreementCheckboxState extends State<AgreementCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        'I agree with the Terms of Service & Privacy Policy',
        style: context.textThemeX.medium.copyWith(
          color: AppColors.primary,
        ),
      ),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.primary,
    );
  }
}
