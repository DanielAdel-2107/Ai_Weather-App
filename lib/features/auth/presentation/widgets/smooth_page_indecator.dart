import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndecator extends StatelessWidget {
  const SmoothPageIndecator({
    super.key,
    required this.controller,
    this.onDotClicked,
  });

  final PageController controller;
  final Function(int)? onDotClicked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSize.padding16(context)),
      child: SmoothPageIndicator(
        controller: controller,
        count: 3,
        onDotClicked: onDotClicked,
        effect: JumpingDotEffect(
          jumpScale: 0.7,
          verticalOffset: 15,
        ),
      ),
    );
  }
}
