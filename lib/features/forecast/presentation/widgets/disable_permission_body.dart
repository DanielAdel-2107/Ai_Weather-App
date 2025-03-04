import 'package:ai_weather/core/components/custom_elevated_button.dart';
import 'package:ai_weather/core/utilies/assets/lotties/app_lotties.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisablePermissionBody extends StatelessWidget {
  const DisablePermissionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Lottie.asset(AppLotties.location),
              Text(
                AppStrings.locationPermission,
                style: AppTextStyles.title24WhiteW500,
              ),
            ],
          ),
          CustomElevatedButton(
            name: AppStrings.getForecast,
            backgroundColor: AppColors.secondryColor,
            onPressed: () {
              context.getForecastCubit.getForecast();
            },
          ),
        ],
      ),
    );
  }
}
