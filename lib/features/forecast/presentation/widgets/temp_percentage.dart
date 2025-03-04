import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/features/forecast/domain/entities/forecast_entity.dart';
import 'package:ai_weather/features/forecast/presentation/widgets/percentage_circle.dart';
import 'package:flutter/material.dart';

class TempPercentage extends StatelessWidget {
  const TempPercentage({
    super.key,
    required this.forecast,
  });
  final ForecastEntity forecast;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PercentageCircle(
          percentage: forecast.minTempByCelsius,
          title: AppStrings.minTemp,
        ),
        PercentageCircle(
            percentage: forecast.avgTempByCelsius,
            title: AppStrings.avgTemp),
        PercentageCircle(
          percentage: forecast.maxTempByCelsius,
          title: AppStrings.maxTemp,
        ),
      ],
    );
  }
}
