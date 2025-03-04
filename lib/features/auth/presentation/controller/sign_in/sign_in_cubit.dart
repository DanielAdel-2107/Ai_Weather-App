import 'package:ai_weather/core/error/get_error_message_from_exception.dart';
import 'package:ai_weather/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'sign_in_cubit_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.signInUseCaes}) : super(SignInInitial());
  final SignInUseCase signInUseCaes;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      emit(SignInLoading());
      final response = await signInUseCaes(
        email: emailController.text,
        password: passwordController.text,
      );
      response.fold(
        (failure) {
          emit(SignInFailed(error: getErrorMessageFromException(failure)));
        },
        (unit) {
          emit(SignInSuccess());
        },
      );
    }
  }
}
