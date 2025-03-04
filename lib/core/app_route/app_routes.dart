import 'package:ai_weather/core/app_route/route_names.dart';
import 'package:ai_weather/features/auth/presentation/screens/login_or_signup_screen.dart';
import 'package:ai_weather/features/auth/presentation/screens/login_screen.dart';
import 'package:ai_weather/features/auth/presentation/screens/signup_screen.dart';
import 'package:ai_weather/features/forecast/presentation/screens/forecast_screen.dart';
import 'package:ai_weather/features/splash/presentation/screens/on_boarding_screen.dart';
import 'package:ai_weather/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    RouteNames.splashScreen: (context) => const SplashScreen(),
    RouteNames.onBoardingScreen: (context) => const OnBoardingScreen(),
    RouteNames.loginOrSignupScreen: (context) => const LoginOrSignupScreen(),
    RouteNames.loginScreen: (context) => const LoginScreen(),
    RouteNames.signUpScreen: (context) => const SignUpScreen(),
    RouteNames.forecastScreen: (context) => const ForecastScreen(),
  };
}
