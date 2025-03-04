import 'package:ai_weather/core/utilies/assets/images/app_images.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/core/utilies/constants/app_timers.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreenBody extends StatelessWidget {
  const SplashScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: AppSize.r100(context),
              backgroundImage: AssetImage(AppImages.logo),
            ).animate().fade().scale(delay: AppTimers.timer800Ms.ms),
            Text(
              AppStrings.appName,
              style: AppTextStyles.title28WhiteW500,
            )
                .animate()
                .fadeIn(duration: AppTimers.timer800Ms.ms)
                .scale(delay: AppTimers.timer1000Ms.ms)
          ],
        ),
      ),
    );
  }
}
