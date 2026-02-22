import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/constants/app_colors.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';

class DeviceCard extends StatefulWidget {
  final String deviceName;
  final String deviceLocation;
  final String imagePath;
  final bool initialActiveState;

  const DeviceCard({
    required this.deviceName, required this.deviceLocation, required this.imagePath, super.key,
    this.initialActiveState = false,
  });

  @override
  State<StatefulWidget> createState() => _DeviceCardState();
}

class _DeviceCardState extends State<DeviceCard> {
  late bool isActive;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialActiveState;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorsX.primary,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: 135.w,
                    height: 135.h,
                    padding: EdgeInsetsDirectional.only(start: 20.w, top: 5.h),
                    alignment: AlignmentDirectional.topStart,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.images.backDevice.path),
                        alignment: AlignmentDirectional.topStart,
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Image.asset(
                        widget.imagePath,
                        fit: BoxFit.contain,
                        height: 70.w,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Transform.rotate(
                      angle: 3.14 / 2,
                      child: Switch(
                        value: isActive,
                        onChanged: (value) {
                          setState(() {
                            isActive = value;
                          });
                        },
                        activeColor: context.colorsX.primary,
                        activeTrackColor: context.colorsX.secondary,
                        inactiveThumbColor: context.colorsX.primary,
                        inactiveTrackColor: AppColors.track,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.deviceName,
                  style: context.textThemeX.medium,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.deviceLocation,
                  style: context.textThemeX.small,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
