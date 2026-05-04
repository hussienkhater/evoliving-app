part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final LoginResponseModel user;
  LoginSuccessState(this.user);
}

class RegisterSuccessState extends AuthState {
  final RegisterResponseModel user;
  RegisterSuccessState(this.user);
}

class ErrorState extends AuthState {
  final String messageError;
  ErrorState(this.messageError);
}

class UnauthenticatedState extends AuthState {}