import 'package:flutter/material.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/widgets/spacing.dart';

class WeatherInfoWidget extends StatelessWidget {
  final String condition;
  final String temperature;

  const WeatherInfoWidget({
    required this.condition,
    required this.temperature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
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
              temperature,
              style: context.textThemeX.heading.bold,
            ),
          ],
        ),
      ),
    );
  }
}
