import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/home/presentation/widgets/weather_info_widget.dart';
import 'package:evoliving/app/widgets/spacing.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(Assets.images.profile.path),
            ),
            horizontalSpace(12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome home,',
                  style: context.textThemeX.medium,
                ),
                Text(
                  'George Wassouf',
                  style: context.textThemeX.large.bold,
                )
              ],
            ),
            const Spacer(),
            PopupMenuButton<int>(
              icon: const Icon(Icons.add_circle_outline,
                  color: Colors.white, size: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              itemBuilder: (context) => [
                _buildMenuItem(Icons.devices, 'Add Device', 0),
                _buildMenuItem(Icons.sensors, 'Create scene', 1),
                _buildMenuItem(Icons.access_time, 'Add Quick toggle card', 2),
                _buildMenuItem(Icons.qr_code_scanner, 'Scan', 3),
              ],
              onSelected: (value) {
                // تنفيذ أي شيء عند الضغط على عنصر في القائمة
              },
            ),
            horizontalSpace(12),
            const Icon(Icons.headset_mic_sharp, color: Colors.white, size: 20),
          ],
        ),
        verticalSpace(26),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.home_outlined, color: Colors.white, size: 25),
            horizontalSpace(12),
            Text(
              'Home Name...',
              style: context.textThemeX.large,
            ),
            const Spacer(),
            Container(
              height: 30.h,
              width: 30.w,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              padding: EdgeInsets.zero,
              child: PopupMenuButton<int>(
                icon:
                    const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                padding: EdgeInsets.all(3.r),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                itemBuilder: (context) => [
                  _buildMenuItem(Icons.devices, 'Add Device', 0),
                  _buildMenuItem(Icons.sensors, 'Create scene', 1),
                  _buildMenuItem(Icons.access_time, 'Add Quick toggle card', 2),
                  _buildMenuItem(Icons.qr_code_scanner, 'Scan', 3),
                ],
                onSelected: (value) {

                },
              ),
            ),
          ],
        ),
        verticalSpace(15),
        Container(
          height: 100.h,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            children: [
              horizontalSpace(8),
              Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Assets.images.weather.image(
                    fit: BoxFit.cover,
                    width: 80.w,
                    height: 80.h,
                  )),
              horizontalSpace(20),
              const WeatherInfoWidget(
                condition: 'Partly Cloudy',
                temperature: '23°',
              ),
              horizontalSpace(6),
              const WeatherInfoWidget(
                condition: 'Humidity',
                temperature: '67%',
              ),
              const WeatherInfoWidget(
                condition: 'Wind Speed',
                temperature: '3.1m/s',
              ),
              horizontalSpace(8),
            ],
          ),
        ),
      ],
    );
  }

  PopupMenuItem<int> _buildMenuItem(IconData icon, String text, int value) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, color: Colors.black87),
          const SizedBox(width: 10),
          Text(text,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
