import 'package:ai_weather/core/utilies/assets/images/app_images.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/features/splash/presentation/widgets/shadow_and_skip_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreenBody extends StatelessWidget {
  const OnBoardingScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.basketballImage,
          height: context.screenHeight,
          width: context.screenWidth,          
          fit: BoxFit.fill,
        ),
        ShadowAndSkipButton()
      ],
    );
  }
}
