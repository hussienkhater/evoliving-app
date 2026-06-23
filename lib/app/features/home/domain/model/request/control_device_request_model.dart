class ControlDeviceRequestModel {
  final int relayId;
  final String state;

  ControlDeviceRequestModel({
    required this.relayId,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      "relayId": relayId,
      "state": state,
    };
  }
}