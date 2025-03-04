import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingForecastBody extends StatelessWidget {
  const LoadingForecastBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.greyColor,
      ),
    );
  }
}
