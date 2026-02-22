import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:evoliving/app/core/enums/status.dart';
import 'package:evoliving/app/core/models/generic_exception.dart';
import 'package:evoliving/app/features/authentication/domain/repositories/auth_repository.dart';

part 'sign_up_state.dart';

@Singleton()
class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._authRepository) : super(const SignUpState());
  final AuthRepository _authRepository;

  void emailChanged(String value) =>
      emit(state.copyWith(email: Email.dirty(value)));

  void nameChanged(String value) =>
      emit(state.copyWith(name: Name.dirty(value)));

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    final confirmedPassword = ConfirmPassword.dirty(
      password: password.value,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
        password: password,
        confirmedPassword: confirmedPassword,
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(confirmedPassword: confirmedPassword));
  }

  Future<void> signUpFormSubmitted() async {
    emit(state.copyWith(status: const Loading()));
    try {
      await _authRepository.signUp(
        email: state.email.value,
        password: state.password.value,
        name: state.name.value,
        phoneNumber: '',
      );
      emit(state.copyWith(status: const Success(null)));
    } catch (e) {
      emit(state.copyWith(status: Failure(e as GenericException)));
    }
  }
}
