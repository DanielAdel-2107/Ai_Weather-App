import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class WelcomeAndUserName extends StatelessWidget {
  const WelcomeAndUserName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.hello,
              style: AppTextStyles.title26SecondaryColorW700,
            ),
            Text(
              context.getForecastCubit.userName,
              style: AppTextStyles.title22GreyColor,
            ),
          ],
        ),
        Icon(
          Icons.menu,
          color: AppColors.secondryColor,
          size: context.screenWidth * 0.1,
        )
      ],
    );
  }
}
