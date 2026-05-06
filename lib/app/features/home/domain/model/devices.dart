import 'package:evoliving/app/core/assets_gen/assets.gen.dart';

class Device {
  final String name;
  final String location;
  final String imagePath;
  final int relayId;
  bool isActive;

  Device({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.relayId,
    this.isActive = false,
  });
}

class DeviceConstants {
  static final List<Device> devices = [
    Device(
      name: 'Smart Lamp',
      location: 'Living Room',
      imagePath: Assets.images.smartLamp.path,
      relayId: 1,
    ),
    Device(
      name: 'Speaker',
      location: 'Bedroom',
      imagePath: Assets.images.speaker.path,
      relayId: 2,
    ),
    Device(
      name: 'Air Conditioner',
      location: 'Living Room',
      imagePath: Assets.images.airConditioner.path,
      relayId: 3,
    ),
    Device(
      name: 'Humidifier',
      location: 'Office',
      imagePath: Assets.images.humidifier.path,
      relayId: 4,
    ),
  ];
}