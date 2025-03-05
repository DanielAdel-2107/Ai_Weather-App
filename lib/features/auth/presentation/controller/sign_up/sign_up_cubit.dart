import 'dart:developer';

import 'package:ai_weather/core/error/get_error_message_from_exception.dart';
import 'package:ai_weather/core/utilies/constants/app_timers.dart';
import 'package:ai_weather/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:ai_weather/features/auth/presentation/widgets/signup_screen_first_step.dart';
import 'package:ai_weather/features/auth/presentation/widgets/signup_screen_second_step.dart';
import 'package:ai_weather/features/auth/presentation/widgets/signup_screen_third_step.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.signupUseCaes}) : super(SignUpInitial());
  final SignUpUseCase signupUseCaes;
  // sign up steps & page controller
  final PageController controller = PageController(viewportFraction: 1.0);
  int _currentIndex = 0;
  List<Widget> signupSteps = [
    SignupScreenFristStep(key: PageStorageKey('step1')),
    SignupScreenSecondStep(key: PageStorageKey('step2')),
    SignupScreenThirdStep(key: PageStorageKey('step3')),
  ];

  changeIndex(int index) {
    _currentIndex = index;
  }

  void changePage() {
    if (_currentIndex < 2) {
      updateController();
    } else {
      signUp();
    }
  }

  updateController() {
    controller.animateToPage(_currentIndex + 1,
        duration: Duration(milliseconds: AppTimers.timer500Ms),
        curve: Curves.fastOutSlowIn);
  }

  // select gender
  int _genderType = 0;
  int get genderType => _genderType;
  selectGender(int index) {
    _genderType = index;
    emit(SelectGenderState(
      _genderType,
    ));
  }

  // sign up
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final yearController = TextEditingController();
  final monthController = TextEditingController();
  final dayController = TextEditingController();
  final lenghtController = TextEditingController();
  final weightController = TextEditingController();
  final countryController = TextEditingController();

  Future<void> signUp() async {
      emit(SignUpLoading());
      _currentIndex = 0;
      final response = await signupUseCaes(
        email: emailController.text,
        password: passwordController.text,
        displayName: fullNameController.text,
      );
      response.fold(
        (failure) {
          emit(SignUpFailed(
              errorMessage: getErrorMessageFromException(failure)));
        },
        (unit) {
          emit(SignUpSuccess());
        },
      );
    }
}
