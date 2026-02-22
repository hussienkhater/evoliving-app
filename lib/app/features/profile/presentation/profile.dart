import 'package:flutter/material.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  static const String name = 'profile-screen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile',
        style: context.textThemeX.large.bold
            .copyWith(color: context.colorsX.primary),
      ),
    );
  }
}
