import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName;
  final String deviceLocation;
  final String imagePath;
  final bool isActive;
  final bool isLoading;
  final Function(bool value) onToggle;

  const DeviceCard({
    super.key,
    required this.deviceName,
    required this.deviceLocation,
    required this.imagePath,
    required this.isActive,
    required this.isLoading,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(imagePath, height: 70.w),
                ),
                if (isLoading)
                  const CircularProgressIndicator()
                else
                  Transform.rotate(
                    angle: 3.14 / 2,
                    child: Switch(
                      value: isActive,
                      onChanged: (value) {
                        onToggle(value);
                      },
                      activeColor: context.colorsX.primary,
                      activeTrackColor: context.colorsX.mintGreen,
                      inactiveThumbColor: context.colorsX.primary,
                      inactiveTrackColor: AppColors.track,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(deviceName),
                const SizedBox(height: 4),
                Text(deviceLocation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
