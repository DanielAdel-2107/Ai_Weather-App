import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:flutter/material.dart';

class SignUpSteps extends StatelessWidget {
  const SignUpSteps({
    super.key,
    required this.onPageChanged,
    required this.controller,
    required this.signupSteps,
  });

  final Function(int)? onPageChanged;
  final PageController controller;
  final List<Widget> signupSteps;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.55,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        controller: controller,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Center(
            child: signupSteps[index],
          );
        },
      ),
    );
  }
}
