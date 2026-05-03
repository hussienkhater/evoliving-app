part of 'auth_cubit.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingState extends AuthState {}

final class SuccessState extends AuthState {
  final LoginResponseModel user;

  SuccessState(this.user);
}

final class ErrorState extends AuthState {
  final String messageError;

  ErrorState(this.messageError);
}

final class UnauthenticatedState extends AuthState {}