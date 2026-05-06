class DeviceStatusModel {
  final String relayId;
  final String state;

  DeviceStatusModel({
    required this.relayId,
    required this.state,
  });

  factory DeviceStatusModel.fromJson(Map<String, dynamic> json) {
    return DeviceStatusModel(
      relayId: json['relayId'].toString(),
      state: json['state'],
    );
  }

  bool get isActive => state.toUpperCase() == "ON";
}

class DevicesResponseModel {
  final List<DeviceStatusModel> devices;

  DevicesResponseModel({required this.devices});

  factory DevicesResponseModel.fromJson(Map<String, dynamic> json) {
    return DevicesResponseModel(
      devices: (json['devices'] as List)
          .map((e) => DeviceStatusModel.fromJson(e))
          .toList(),
    );
  }
}