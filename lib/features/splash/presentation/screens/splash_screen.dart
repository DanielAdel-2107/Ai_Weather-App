import 'package:ai_weather/core/app_route/route_names.dart';
import 'package:ai_weather/features/splash/presentation/widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    navigateToOnBoardingScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenBody(),
    );
  }

  void navigateToOnBoardingScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, RouteNames.onBoardingScreen);
    });
  }
}
