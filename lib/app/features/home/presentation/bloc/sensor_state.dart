import 'package:evoliving/app/features/control/data/models/sensor_response_model.dart';

sealed class SensorState {}

final class SensorInitial extends SensorState {}

final class SensorLoading extends SensorState {}

final class SensorSuccess extends SensorState {
  final SensorResponseModel sensor;

  SensorSuccess(this.sensor);
}

final class SensorError extends SensorState {
  final String message;

  SensorError(this.message);
}