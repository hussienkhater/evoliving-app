import 'package:bloc/bloc.dart';
import 'package:evoliving/app/core/network/models/secure_storage_service.dart';
import 'package:evoliving/app/core/network/result_api.dart';
import 'package:evoliving/app/features/authentication/data/api/auth_api.dart';
import 'package:evoliving/app/features/authentication/data/models/request/login_request_model.dart';
import 'package:evoliving/app/features/authentication/data/models/request/register_request_model.dart';
import 'package:evoliving/app/features/authentication/data/models/response/login_response_model.dart';
import 'package:evoliving/app/features/authentication/data/models/response/register_response_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  LoginResponseModel? currentUser;
  RegisterResponseModel? currentRegisterUser;

  Future<void> logInWithCredentials(LoginRequestModel request) async {
    emit(LoadingState());

    try {
      final result = await AuthApi.loginAuth(request);

      switch (result) {
        case SuccessApi<LoginResponseModel>():
          currentUser = result.data;

          await SecureStorageService.saveToken(
            result.data.accessToken ?? '',
          );

          await SecureStorageService.saveUser(result.data);

          emit(LoginSuccessState(result.data));
          break;

        case ErrorApi<LoginResponseModel>():
          emit(ErrorState(result.messageError));
          break;
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> registerWithCredentials(RegisterRequestModel request) async {
    emit(LoadingState());

    try {
      final result = await AuthApi.registerAuth(request);

      switch (result) {
        case SuccessApi<RegisterResponseModel>():
          currentRegisterUser = result.data;
          emit(RegisterSuccessState(result.data));
        case ErrorApi<RegisterResponseModel>():
          emit(ErrorState(result.messageError));
          break;
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }

  Future<void> logout() async {
    await SecureStorageService.clearAll();
    currentUser = null;
    emit(UnauthenticatedState());
  }

  Future<void> checkAuth() async {
    emit(LoadingState());

    try {
      final user = await SecureStorageService.getUser();

      if (user != null) {
        currentUser = user;
        emit(LoginSuccessState(user));
      } else {
        emit(UnauthenticatedState());
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
