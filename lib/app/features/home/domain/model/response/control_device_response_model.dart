class ControlDeviceResponseModel {
  final String message;
  final String topic;
  final String data;

  ControlDeviceResponseModel({
    required this.message,
    required this.topic,
    required this.data,
  });

  factory ControlDeviceResponseModel.fromJson(Map<String, dynamic> json) {
    return ControlDeviceResponseModel(
      message: json["message"],
      topic: json["topic"],
      data: json["data"],
    );
  }
}