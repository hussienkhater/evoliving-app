import 'package:evoliving/app/core/assets_gen/assets.gen.dart';

class Device {
  final String name;
  final String location;
  final String imagePath;

  Device({
    required this.name,
    required this.location,
    required this.imagePath,
  });
}

class DeviceConstants {
  static final List<Device> devices = [
    Device(
      name: 'Smart Lamp',
      location: 'Living Room',
      imagePath: Assets.images.smartLamp.path,
    ),
    Device(
      name: 'Speaker',
      location: 'Bedroom',
      imagePath: Assets.images.speaker.path,
    ),
    Device(
      name: 'Air Conditioner',
      location: 'Living Room',
      imagePath: Assets.images.airConditioner.path,
    ),
    Device(
      name: 'Humidifier',
      location: 'Office',
      imagePath: Assets.images.humidifier.path,
    ),
  ];
}
