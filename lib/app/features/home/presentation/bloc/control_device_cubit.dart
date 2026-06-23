import 'package:evoliving/app/core/network/result_api.dart';
import 'package:evoliving/app/features/home/data/control_api.dart';
import 'package:evoliving/app/features/home/domain/model/request/control_device_request_model.dart';
import 'package:evoliving/app/features/home/domain/model/response/control_device_response_model.dart';
import 'package:evoliving/app/features/home/domain/model/response/device_status_model.dart';
import 'package:evoliving/app/features/home/presentation/bloc/control_device_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlDeviceCubit extends Cubit<ControlDeviceState> {
  ControlDeviceCubit() : super(ControlDeviceInitial());

  Map<String, bool> deviceStates = {};
  Map<String, bool> loadingMap = {};

  Future<void> controlDevice({
    required int relayId,
    required bool isOn,
  }) async {
    final id = relayId.toString();

    loadingMap[id] = true;
    emit(ControlDeviceLoading());

    final result = await ControlApi.controlDevice(
      ControlDeviceRequestModel(
        relayId: relayId,
        state: isOn ? "on" : "off",
      ),
    );

    loadingMap[id] = false;

    switch (result) {
      case SuccessApi<ControlDeviceResponseModel>():
        deviceStates[id] = isOn;
        emit(ControlDeviceSuccess(isOn));
        break;

      case ErrorApi<ControlDeviceResponseModel>():
        emit(ControlDeviceError(result.messageError));
        break;
    }
  }

  Future<void> getDevicesStatus() async {
  emit(ControlDeviceLoading());

  final result = await ControlApi.getDevicesStatus();

  switch (result) {
    case SuccessApi<DevicesResponseModel> success:
      final devices = success.data.devices;

      for (var d in devices) {
        deviceStates[d.relayId.toString()] =
            d.state.toUpperCase() == "ON";
      }

      emit(DevicesLoadedState(devices));
      break;

    case ErrorApi<DevicesResponseModel> error:
      emit(ControlDeviceError(error.messageError));
      break;

    default:
      emit(ControlDeviceError("Unknown error"));
  }
}
}
