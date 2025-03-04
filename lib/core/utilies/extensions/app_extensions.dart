import 'package:ai_weather/features/auth/presentation/controller/sign_in/sign_in_cubit.dart';
import 'package:ai_weather/features/auth/presentation/controller/sign_up/sign_up_cubit.dart';
import 'package:ai_weather/features/forecast/presentation/controller/cubit/get_forecast_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension AppExtensions on BuildContext {
  // feature/auth
  SignUpCubit get signUpCubit => read<SignUpCubit>();
  SignInCubit get signInCubit => read<SignInCubit>();

  // feature/forecast
  GetForecastCubit get getForecastCubit => read<GetForecastCubit>();

  // size
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  // navigation
  void pushScreen(String routeName) {
    Navigator.of(this).pushNamed(routeName);
  }

  void pushReplacementScreen(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void pushAndRemoveUntilScreen(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  void popScreen() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  void popWithResult<T>(T result) {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop(result);
    }
  }

  bool canPopScreen() {
    return Navigator.of(this).canPop();
  }
}
