class SensorResponseModel {
  double? temperature;
  double? humidity;

  SensorResponseModel({this.temperature, this.humidity});

  SensorResponseModel.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    humidity = json['humidity'];
  }
}