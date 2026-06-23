import 'package:flutter/material.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/spacing.dart';

class WeatherInfoWidget extends StatelessWidget {
  final String condition;
  final String value;

  const WeatherInfoWidget({
    required this.condition,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            condition,
            style: context.textThemeX.small,
          ),
          verticalSpace(4),
          Text(
            value,
            style: context.textThemeX.heading.bold,
          ),
        ],
      ),
    );
  }
}