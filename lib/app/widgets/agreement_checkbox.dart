import 'package:flutter/material.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';

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
      checkboxShape: const CircleBorder(),
      dense: true,
      title: const Text(
        'I agree with the Terms of Service & Privacy Policy',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 1),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
      },
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.mintGreen,
    );
  }
}
