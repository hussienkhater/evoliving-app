import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/assets_gen/assets.gen.dart' show Assets;
import 'package:evoliving/app/core/theming/app_colors_extension.dart';
import 'package:evoliving/app/core/theming/text_theme_extension.dart';
import 'package:evoliving/app/features/settings/sub_features/privacy_policy/presentaion/widgets/permission_tile.dart';
import 'package:evoliving/app/widgets/screen.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  static const String name = 'privacy-screen';

  @override
  Widget build(BuildContext context) {
    return Screen(
      appBar: AppBar(
        title: Text('Policy', style: context.textThemeX.heading),
        centerTitle: true,
        leadingWidth: 80.w,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: InkWell(
            child: Assets.svgs.backArrow.svg(),
            onTap: () => context.pop(),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: context.colorsX.primary, // Dark container
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              PermissionTile(
                title: 'Notifications',
                description:
                    'Receive device alerts, system notifications, and other messages.',
                value: true,
                onChanged: (val) {},
              ),
              const _divider(),
              PermissionTile(
                title: 'Location',
                description:
                    'Find locations, add devices, get a Wi-Fi network list, and perform scene automation.',
                value: true,
                onChanged: (val) {},
              ),
              const _divider(),
              PermissionTile(
                title: 'Picture',
                description: 'Customize pictures, help & feedback, and more.',
                isNavigable: true,
                onTap: () {
                  context.push('/picture-Policy');
                },
              ),
              const _divider(),
              PermissionTile(
                title: 'Camera',
                description: 'Scan QR codes, customize pictures, and more.',
                value: true,
                onChanged: (val) {},
              ),
              const _divider(),
              PermissionTile(
                title: 'Microphone',
                description:
                    'Pick up the user’s video talks and voice commands when devices such as smart cameras and video doorbells are bound.',
                value: true,
                onChanged: (val) {},
              ),
              const _divider(),
              PermissionTile(
                title: 'Bluetooth',
                description:
                    'During use, this app needs access to Bluetooth, helping discover nearby Bluetooth devices.',
                value: true,
                onChanged: (val) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _divider extends StatelessWidget {
  const _divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.colorsX.background.withValues(alpha: 0.3),
      thickness: 1,
      height: 0,
    );
  }
}
