import 'package:evoliving/app/core/network/result_api.dart';
import 'package:evoliving/app/features/control/data/api/sensor_api.dart';
import 'package:evoliving/app/features/control/data/models/sensor_response_model.dart';
import 'package:evoliving/app/features/home/presentation/bloc/sensor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SensorCubit extends Cubit<SensorState> {
  SensorCubit() : super(SensorInitial());

  Future<void> getLatestSensorData() async {
    emit(SensorLoading());

    final result = await SensorApi.getLatestSensorData();

    switch (result) {
      case SuccessApi<SensorResponseModel>():
        emit(SensorSuccess(result.data));
        break;

      case ErrorApi():
        emit(SensorError(result.messageError));
        break;
    }
  }
}