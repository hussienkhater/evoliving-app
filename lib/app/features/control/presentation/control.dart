import 'package:app_settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart';
import 'package:evoliving/app/core/extension_methods/text_style_x.dart';
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';

class ControlScreen extends StatefulWidget {
  const ControlScreen({super.key});

  static const String name = 'control-screen';

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(Assets.svgs.backArrow.path,
                      colorFilter: ColorFilter.mode(
                        context.colorsX.secondary,
                        BlendMode.srcIn,
                      )),
                  Text(
                    'Add Device',
                    style: context.textThemeX.large.bold.copyWith(
                        color: context.colorsX.primary,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SvgPicture.asset(Assets.svgs.qrScan.path,
                      colorFilter: ColorFilter.mode(
                        context.colorsX.primary,
                        BlendMode.srcIn,
                      )),
                ],
              ),
              const SizedBox(height: 24),
              _buildOptionTile(
                  Icons.bluetooth,
                  'Turn on Bluetooth',
                  'Bluetooth makes your device more discoverable.',
                  context, () {
                AppSettings.openAppSettings(type: AppSettingsType.bluetooth);
              }),
              _buildOptionTile(Icons.wifi, 'Turn on Wi-Fi',
                  'Wi-Fi makes your device more discoverable.', context, () {
                AppSettings.openAppSettingsPanel(AppSettingsPanelType.wifi);
              }),
              const SizedBox(height: 20),
              Center(
                child: RadarSignal(controller: _controller),
              ),
              const SizedBox(height: 20),
              const Divider(),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Add Manually',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              _buildDeviceGrid(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(IconData icon, String title, String subtitle,
      BuildContext context, VoidCallback onTap) {
    return Card(
      color: context.colorsX.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.white,
                child: Icon(icon, color: context.colorsX.primary)),
            PositionedDirectional(
                top: -12,
                end: -6,
                child: Container(
                  height: 25.h,
                  width: 25.w,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.w),
                  ),
                  padding: EdgeInsets.all(2.r),
                  child: const Icon(
                    CupertinoIcons.exclamationmark,
                    color: Colors.white,
                    size: 18,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceGrid() {
    final devices = <Map<String, Object>>[
      {'name': 'Air condition', 'icon': Icons.ac_unit},
      {'name': 'Light', 'icon': Icons.lightbulb},
      {'name': 'Water boiler', 'icon': Icons.water},
      {'name': 'Fan', 'icon': Icons.toys},
      {'name': 'Air purifier', 'icon': Icons.air},
      {'name': 'Cleaner robot', 'icon': Icons.cleaning_services},
      {'name': 'Smart door', 'icon': Icons.door_front_door},
      {'name': 'Vacuum Cleaner', 'icon': Icons.local_laundry_service},
      {'name': 'Lawn robot', 'icon': Icons.agriculture},
      {'name': 'Loud', 'icon': Icons.speaker},
      {'name': 'Aquarium Heater', 'icon': Icons.water_damage},
      {'name': 'Television', 'icon': Icons.tv},
      {'name': 'Coffee Machine', 'icon': Icons.coffee},
      {'name': 'Rice cooker', 'icon': Icons.rice_bowl},
      {'name': 'Electromagnetic Stove', 'icon': Icons.kitchen},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.9,
      ),
      itemCount: devices.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(devices[index]['icon'] as IconData?,
                size: 40, color: Colors.blueGrey),
            const SizedBox(height: 8),
            Text(
              devices[index]['name']! as String,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}

class RadarSignal extends StatelessWidget {
  const RadarSignal({
    required this.controller, super.key,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.w,
      height: 230.h,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(Assets.images.radar.path),
          )),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(controller),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: SweepGradient(
              center: FractionalOffset.center,
              colors: <Color>[
                Colors.transparent,
                Color(0xFF4D6371),
                Colors.transparent,
              ],
              stops: <double>[0.20, 0.25, 0.50],
            ),
          ),
        ),
      ),
    );
  }
}
