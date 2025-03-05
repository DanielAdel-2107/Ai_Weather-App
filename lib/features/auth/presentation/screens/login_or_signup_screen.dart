import 'package:ai_weather/features/auth/presentation/widgets/login_or_signup_screen_body.dart';
import 'package:flutter/material.dart';

class LoginOrSignupScreen extends StatelessWidget {
  const LoginOrSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginOrSignupScreenBody(),
    );
  }
}
