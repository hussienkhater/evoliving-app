import 'package:evoliving/app/features/home/domain/model/response/control_device_response_model.dart';
import 'package:evoliving/app/features/home/domain/model/response/device_status_model.dart';

abstract class ControlDeviceState {}

class ControlDeviceInitial extends ControlDeviceState {}

class ControlDeviceLoading extends ControlDeviceState {}

class ControlDeviceSuccess extends ControlDeviceState {
  final bool isActive;
  ControlDeviceSuccess(this.isActive);
}

class DevicesLoadedState extends ControlDeviceState {
  final List<DeviceStatusModel> devices;

  DevicesLoadedState(this.devices);
}

class ControlDeviceError extends ControlDeviceState {
  final String message;

  ControlDeviceError(this.message);
}